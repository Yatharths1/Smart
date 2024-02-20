// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/user_home.dart';
import 'package:smart/widgets/emptysection.dart';
import 'package:smart/widgets/subtitle.dart';

class PaySuccess extends StatefulWidget {
  const PaySuccess({Key? key}) : super(key: key);

  @override
  State<PaySuccess> createState() => _PaySuccessState();
}

class _PaySuccessState extends State<PaySuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          EmptySection(
            emptyImg: 'images/success.gif',
            emptyMsg: 'Successful !!',
          ),
          SubTitle(
            subTitleText: 'Your payment was done successfully',
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => UserHomeScreen()));
          }, child: Text('Ok')),
        ],
      ),
    );
  }
}