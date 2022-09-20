import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

class LoginWithPhone extends StatefulWidget {
  const LoginWithPhone({Key? key}) : super(key: key);

  @override
  State<LoginWithPhone> createState() => _LoginWithPhoneState();
}

class _LoginWithPhoneState extends State<LoginWithPhone> {
  late TextEditingController phoneController;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    phoneController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  void phoneSignIn() {
    FirebaseAuthMethods(FirebaseAuth.instance)
        .phoneSignIn(context, phoneController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login with Phone'),
      ),
      body: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: phoneController,
                validator: (phone) {
                  return phoneController.text.length == 10
                      ? null
                      : "Invalid Phone Number";
                },
                maxLength: 10,
                decoration: const InputDecoration(
                  counterText: "",
                  hintText: 'Enter Phone Number',
                  prefix: Text('+977'),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    phoneSignIn();
                  }
                },
                child: const Text('Send OTP'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
