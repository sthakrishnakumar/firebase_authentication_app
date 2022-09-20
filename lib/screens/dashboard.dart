import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/screens/facebook_logged_in_dashboard.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  Dashboard({Key? key, this.data = 'Dashboard'}) : super(key: key);

  String data;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data),
      ),
      body: widget.data == "facebook"
          ? const FacebookDashboard()
          : Padding(
              padding: const EdgeInsets.only(left: 90),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Phone Verified Dashboard'),
                  ElevatedButton(
                    onPressed: () {
                      FirebaseAuthMethods(FirebaseAuth.instance)
                          .logOut(context);
                    },
                    child: const Text('Log Out'),
                  )
                ],
              ),
            ),
    );
  }
}
