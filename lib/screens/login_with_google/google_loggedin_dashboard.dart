import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../services/firebase_auth_methods.dart';

class GoogleDashboard extends StatelessWidget {
  const GoogleDashboard({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('This is Google Verified Dashboard'),
          const SizedBox(
            height: 20,
          ),
          if (user.photoURL != null)
            CircleAvatar(
              backgroundImage: NetworkImage(user.photoURL!),
            ),
          if (user.photoURL == null)
            const CircleAvatar(
              child: Icon(Icons.person),
            ),
          const SizedBox(
            height: 20,
          ),
          // ignore: unnecessary_null_comparison
          Text('Name: ${user.displayName}'),
          const SizedBox(
            height: 20,
          ),
          // ignore: unnecessary_null_comparison
          Text('Photo Url: \n${user.photoURL}'),
          const SizedBox(
            height: 20,
          ),
          // ignore: unnecessary_null_comparison
          Text('Email: ${user.email}'),

          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () {
              FirebaseAuthMethods(FirebaseAuth.instance).logOut(context);
            },
            child: const Text('Log Out'),
          ),
        ],
      ),
    );
  }
}
