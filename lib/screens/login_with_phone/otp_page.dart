import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:firebase_authentication_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({Key? key}) : super(key: key);

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  String codeValue = "";

  void verifyOTP() {
    FirebaseAuthMethods(FirebaseAuth.instance).verifyOTP(context, codeValue);
  }

  @override
  void initState() {
    listenOTP();
    super.initState();
  }

  void listenOTP() async {
    await SmsAutoFill().listenForCode();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Page'),
      ),
      body: Column(
        children: [
          PinFieldAutoFill(
            currentCode: codeValue,
            decoration: const UnderlineDecoration(
              colorBuilder: FixedColorBuilder(Colors.grey),
              textStyle: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              ),
            ),
            onCodeChanged: (code) {
              setState(() {
                codeValue = code.toString();
              });
            },
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              try {
                verifyOTP();
              } on FirebaseAuthException catch (e) {
                snackbar(context, e.message!, color: Colors.red);
              }
            },
            child: const Text('Verify OTP'),
          ),
        ],
      ),
    );
  }
}
