import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_auth_methods.dart';

class PhoneDashboard extends StatelessWidget {
  const PhoneDashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 90),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Phone Verified Dashboard'),
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
