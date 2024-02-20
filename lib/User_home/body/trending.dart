// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/product_card.dart';
import 'package:smart/User_home/body/products.dart';
import 'package:smart/User_home/body/sections.dart';
import 'package:smart/widgets/size_config.dart';


class PopularProducts extends StatelessWidget {
  PopularProducts();

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Column(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SectionTitle(title: "Popular Products",),
          // GestureDetector(
          //   onTap: press,
          //   child: const Text(
          //     "See More",
          //     style: TextStyle(color: Color(0xFFBBBBBB)),
          //   ),
          // ),
        ),
        SizedBox(height: getProportionateScreenWidth(20)),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ...List.generate(
                demoProducts.length,
                    (index) {
                  if (demoProducts[index].isPopular) {
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
      ],
    );
  }
}