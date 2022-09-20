import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_authentication_app/services/firebase_auth_methods.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class UserModel {
  final String name;
  final String email;

  UserModel(this.name, this.email);
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      UserModel(json["name"], json["email"]);
}

class FacebookDashboard extends StatefulWidget {
  const FacebookDashboard({Key? key}) : super(key: key);

  @override
  State<FacebookDashboard> createState() => _FacebookDashboardState();
}

class _FacebookDashboardState extends State<FacebookDashboard> {
  late Future<UserModel> userData;
  @override
  void initState() {
    userData = FacebookAuth.instance.getUserData().then((value) {
      return UserModel.fromJson(value);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<UserModel>(
      future: userData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text('Name: ${snapshot.requireData.name}'),
                const SizedBox(
                  height: 20,
                ),
                Text('Email: ${snapshot.requireData.email}'),
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
        } else if (snapshot.hasError) {
          return const Text('Something Went Wrong');
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
