// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/rounded_btn.dart';
import 'package:smart/User_home/body/products.dart';
import 'package:smart/widgets/size_config.dart';

class ColorDots extends StatefulWidget {
  ColorDots({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  State<ColorDots> createState() => _ColorDotsState();
}

class _ColorDotsState extends State<ColorDots> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    // Now this is fixed and only for demo
    return Padding(
      padding:
      EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        children: [
          Text("Quantity",
            style: TextStyle(
            fontSize: 30,
            ),
          ),
          const Spacer(),
          RoundedIconBtn(
            icon: Icons.remove,
            showShadow: true,
            press: () {
              if(quantity > 1) {
                quantity = quantity - 1;
                setState(() {});
              }
            },
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          Text("$quantity",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          SizedBox(width: getProportionateScreenWidth(15)),
          RoundedIconBtn(
            icon: Icons.add,
            showShadow: true,
            press: () {
              quantity = quantity + 1;
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}