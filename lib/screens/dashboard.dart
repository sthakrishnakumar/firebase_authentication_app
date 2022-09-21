import 'package:firebase_authentication_app/screens/login_with_facebook/facebook_logged_in_dashboard.dart';
import 'package:firebase_authentication_app/screens/login_screen.dart';
import 'package:firebase_authentication_app/screens/login_with_google/google_loggedIn_dashboard.dart';
import 'package:firebase_authentication_app/screens/login_with_phone/phone_loggedin_dashboard.dart';
import 'package:flutter/material.dart';

import '../auth/local_db.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key, this.phone = ""}) : super(key: key);
  final String phone;

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  String type = "";
  Future data() async {
    String result = await DbClient().getData(dbKey: 'auth');
    setState(() {
      type = result;
    });
  }

  @override
  void initState() {
    data();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: type == "Facebook"
          ? const FacebookDashboard()
          : type == 'Phone'
              ? PhoneDashboard(
                  number: widget.phone,
                )
              : type == 'Google'
                  ? const GoogleDashboard()
                  : const LoginScreen(),
    );
  }
}
