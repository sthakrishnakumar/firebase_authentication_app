import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../auth/local_db.dart';
import '../../services/firebase_auth_methods.dart';

class PhoneDashboard extends StatefulWidget {
  const PhoneDashboard({Key? key}) : super(key: key);

  @override
  State<PhoneDashboard> createState() => _PhoneDashboardState();
}

class _PhoneDashboardState extends State<PhoneDashboard> {
  String number = "";
  Future data() async {
    String result = await DbClient().getData(dbKey: 'phoneNumber');
    setState(() {
      number = result;
    });
  }

  @override
  void initState() {
    data();
    super.initState();
  }

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
