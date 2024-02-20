// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/profile/components/profile_body.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: ProfileBody(),
    );
  }
}


AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        Text(
          "My Profile",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}