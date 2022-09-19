import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/screens/facebook_logged_in_dashboard.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 90),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Sign In With Phone'),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            // ElevatedButton(
            //   onPressed: () {},
            //   child: const Text('Sign In With Google'),
            // ),
            // const SizedBox(
            //   height: 20,
            // ),
            ElevatedButton(
              onPressed: () {
                FirebaseAuthMethods(FirebaseAuth.instance)
                    .signInWithFacebook(context);
              },
              child: const Text('Sign In With Facebook'),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Home Page'),
      // ),
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            return const FacebookDashboard();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const LoginScreen();
          }
        }),
      ),
    );
  }
}
