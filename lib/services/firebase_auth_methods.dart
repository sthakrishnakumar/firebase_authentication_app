import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/screens/facebook_logged_in_dashboard.dart';
import 'package:firebase_authentication_app/screens/login_screen.dart';
import 'package:firebase_authentication_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class FirebaseAuthMethods {
  final FirebaseAuth _auth;

  FirebaseAuthMethods(this._auth);

  //Facebook Sign In
  Future<void> signInWithFacebook(BuildContext context) async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance
          .login(permissions: ['email', 'public_profile', 'user_birthday']);
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      await _auth.signInWithCredential(facebookAuthCredential);
      // ignore: use_build_context_synchronously
      navigation(context, const FacebookDashboard());
    } on FirebaseAuthException catch (e) {
      snackbar(context, e.message!);
    }
  }

  void logout(BuildContext context) async {
    await FacebookAuth.instance.logOut();
    await FirebaseAuth.instance.signOut();
    // ignore: use_build_context_synchronously
    pushNavigation(
      context,
      const LoginScreen(),
    );
  }
}
