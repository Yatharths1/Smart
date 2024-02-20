import 'package:flutter/material.dart';
import 'package:smart/authentication/user_login.dart';
import 'package:smart/authentication/user_signup.dart';

class UserAuth extends StatefulWidget {
  const UserAuth({Key? key}) : super(key: key);

  @override
  State<UserAuth> createState() => _UserAuthState();
}

class _UserAuthState extends State<UserAuth> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "S-mart",
            style: TextStyle(
              fontSize: 60,
              color: Colors.white,
              fontFamily: "Lobster",
            ),
          ),
          centerTitle: true,
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.lock, color: Colors.white,),
                text: "Login",
              ),
              Tab(
                icon: Icon(Icons.lock, color: Colors.white,),
                text: "Register",
              ),
            ],
          ),
        ),
        body: Container(
          child: const TabBarView(
            children: [
              UserSignInInfo(),
              UserSignUp(),
            ],
          ),
        ),
      ),
    );
  }
}

