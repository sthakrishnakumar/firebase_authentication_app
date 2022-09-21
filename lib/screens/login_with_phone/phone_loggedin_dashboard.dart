import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_auth_methods.dart';

class PhoneDashboard extends StatelessWidget {
  const PhoneDashboard({Key? key, required this.number}) : super(key: key);
  final String number;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Phone Verified Dashboard'),
          const SizedBox(
            height: 20,
          ),
          Text("Registered Number: $number"),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance).logOut(context);
            },
            child: const Text('Log Out'),
          )
        ],
      ),
    );
  }
}
