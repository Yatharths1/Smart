// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/product_card.dart';
import 'package:smart/User_home/body/products.dart';
import 'package:smart/widgets/size_config.dart';


class BeautyProducts extends StatelessWidget {
  BeautyProducts({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: buildBar(context),
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: getProportionateScreenHeight(20)),
                ...List.generate(
                  demoProducts.length,
                      (index) {
                    if (demoProducts[index].type == "Beauty Products") {
                      return ProductCard(product: demoProducts[index]);
                    }
                    return SizedBox
                        .shrink(); // here by default width and height is 0
                  },
                ),
                SizedBox(width: getProportionateScreenWidth(20)),
              ],
            ),
          )
      ),
    );
  }
}



AppBar buildBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Beauty Products",
          style: TextStyle(color: Colors.black),
        ),
      ]
    ),
  );
}