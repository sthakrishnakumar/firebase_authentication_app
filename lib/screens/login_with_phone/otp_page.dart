import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPpage extends StatefulWidget {
  const OTPpage({Key? key, required this.phoneNumber}) : super(key: key);

  final String phoneNumber;

  @override
  State<OTPpage> createState() => _OTPpageState();
}

class _OTPpageState extends State<OTPpage> {
  String codeValue = "";
  bool isLoading = false;
  bool canResendOTP = false;

  void verifyOTP() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .verifyOTP(context, codeValue, widget.phoneNumber);
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Enter OTP'),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: PinFieldAutoFill(
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
          ),
          const SizedBox(
            height: 20,
          ),
          isLoading
              ? const Center(child: CircularProgressIndicator())
              : ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });
                    verifyOTP();
                    Timer(const Duration(seconds: 2), () {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: const Text('Verify OTP'),
                ),
        ],
      ),
    );
  }
}
