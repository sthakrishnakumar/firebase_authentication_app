import 'package:firebase_authentication_app/screens/facebook_logged_in_dashboard.dart';
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
          : Column(
              children: const [
                Text('Phone Verified Dashboard'),
              ],
            ),
    );
  }
}
