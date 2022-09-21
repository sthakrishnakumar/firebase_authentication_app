import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/screens/dashboard.dart';
import 'package:firebase_authentication_app/screens/login_screen.dart';
import 'package:firebase_authentication_app/screens/login_with_phone/otp_page.dart';
import 'package:firebase_authentication_app/auth/local_db.dart';
import 'package:firebase_authentication_app/utils/utils.dart';
import 'package:firebase_authentication_app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

//Phone Sign In

  Future<void> phoneSignIn(BuildContext context, String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        snackbar(context, e.message!);
      },
      codeSent: (String verificationId, int? resendToken) {
        WidgetConstant.verify = verificationId;
        pushNavigation(context, const OTPpage());
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

//Verify OTP
  Future<void> verifyOTP(BuildContext context, String codeValue) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: WidgetConstant.verify,
        smsCode: codeValue,
      );

      await _auth.signInWithCredential(credential);
      // ignore: use_build_context_synchronously
      snackbar(context, 'OTP Verified Successfully', color: Colors.green);
      DbClient().setData(dbKey: 'auth', value: 'Phone');
      // ignore: use_build_context_synchronously
      pushNavigation(context, const Dashboard());
    } on FirebaseAuthException catch (e) {
      snackbar(context, e.message!, color: Colors.red);
    }
  }

//Google Sign In
  Future<void> signInWithGoogle(BuildContext context) async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn(
        scopes: <String>["email"],
      ).signIn();

      //obtain auth details from request

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      //create new credential

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

// once signed in , return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      DbClient().setData(dbKey: 'auth', value: 'Google');
      // ignore: use_build_context_synchronously
      navigation(context, const Dashboard());
    } on FirebaseAuthException catch (e) {
      snackbar(context, e.message!);
    }
  }

  //Facebook Sign In
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile', 'user_birthday']);
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);

      DbClient().setData(dbKey: 'auth', value: 'Facebook');
      // ignore: use_build_context_synchronously
      navigation(context, const Dashboard());
    } on FirebaseAuthException catch (e) {
      snackbar(context, e.message!);
    }
  }

  void logOut(BuildContext context) async {
    DbClient().reset();
    await GoogleSignIn().signOut();
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    pushNavigation(
      context,
      const LoginScreen(),
    );
  }
}
