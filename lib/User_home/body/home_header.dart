// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/cart/screen.dart';
import 'package:smart/User_home/body/Components/profile/profilepage.dart';
import 'package:smart/User_home/body/icon_btn.dart';
import 'package:smart/User_home/body/search_field.dart';
import 'package:smart/widgets/size_config.dart';



class HomeHeader extends StatelessWidget {
  const HomeHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SearchField(),
          IconBtnWithCounter(
            svgSrc: "icons/Cart Icon.svg",
            press: (){
              Navigator.push(context, MaterialPageRoute(builder: (c) => CartScreen()));
            },
          ),
          IconBtnWithCounter(
            svgSrc: "icons/User Icon.svg",
            press: () {
              Navigator.push(context, MaterialPageRoute(builder: (c) => ProfileScreen()));
            },
          ),
        ],
      ),
    );
  }
}