// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/banner.dart';
import 'package:smart/User_home/body/categories.dart';
import 'package:smart/User_home/body/home_header.dart';
import 'package:smart/User_home/body/offers.dart';
import 'package:smart/User_home/body/trending.dart';
import 'package:smart/widgets/size_config.dart';

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);

  @override
  State<UserHomeScreen> createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              HomeHeader(),
              SizedBox(height: getProportionateScreenWidth(20)),
              DiscountBanner(),
              SizedBox(height: getProportionateScreenWidth(10)),
              Categories(),
              SizedBox(height: getProportionateScreenWidth(20)),
              SpecialOffers(),
              SizedBox(height: getProportionateScreenWidth(30)),
              PopularProducts(),
              SizedBox(height: getProportionateScreenWidth(30)),
            ],
          ),
        ),
      ),
    );
  }
}
