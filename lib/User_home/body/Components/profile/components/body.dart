// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/profile/components/menu.dart';
import 'package:smart/User_home/body/Components/profile/components/my_profile.dart';
import 'package:smart/User_home/body/Components/profile/components/order.dart';
import 'package:smart/User_home/body/Components/profile/components/pic.dart';
import 'package:smart/authentication/user_auth.dart';
import 'package:smart/gobal/global.dart';

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          ProfilePic(),
          SizedBox(height: 20),
          ProfileMenu(
            text: "My Account",
            icon: "icons/User Icon.svg",
            press: () => {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => MyProfile()))
            },
          ),
          ProfileMenu(
            text: "Last Order",
            icon: "icons/order.svg",
            press: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (c) => MyOrder()));
            },
          ),
          ProfileMenu(
            text: "Settings",
            icon: "icons/Settings.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Help Center",
            icon: "icons/Question mark.svg",
            press: () {},
          ),
          ProfileMenu(
            text: "Log Out",
            icon: "icons/Log out.svg",
            press: () {
              firebaseAuth.signOut().then((value)
              {
                Navigator.push(context, MaterialPageRoute(builder: (c) => const UserAuth()));
              });
            },
          ),
        ],
      ),
    );
  }
}