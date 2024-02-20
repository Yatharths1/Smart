// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/dots.dart';
import 'package:smart/User_home/body/Components/products/desc.dart';
import 'package:smart/User_home/body/Components/products/images.dart';
import 'package:smart/User_home/body/Components/profile/components/order.dart';
import 'package:smart/User_home/body/Components/top_round.dart';
import 'package:smart/User_home/body/cart.dart';
import 'package:smart/User_home/body/products.dart';
import 'package:smart/widgets/default_button.dart';
import 'package:smart/widgets/size_config.dart';


class Body extends StatelessWidget {
  final Product product;

  Body({Key? key, required this.product,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return ListView(
      children: [
        ProductImages(product: product),
        TopRoundedContainer(
          color: Colors.white,
          child: Column(
            children: [
              ProductDescription(
                product: product,
                pressOnSeeMore: () {},
              ),
              TopRoundedContainer(
                color: const Color(0xFFF6F7F9),
                child: Column(
                  children: [
                    ColorDots(product: product),
                    TopRoundedContainer(
                      color: Colors.white,
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: SizeConfig.screenWidth * 0.15,
                          right: SizeConfig.screenWidth * 0.15,
                          bottom: getProportionateScreenWidth(40),
                          top: getProportionateScreenWidth(15),
                        ),
                        child: DefaultButton(
                          text: "Add To Cart",
                          press: () {
                            if(demoCarts.contains(Cart(product: product, numOfItem: 0))){
                              demoCarts.add(Cart(product: product, numOfItem: 2));
                              LastCart.add(LastOrder(product: product, numOfItem: 2));
                            }
                            else{
                              demoCarts.add(Cart(product: product, numOfItem: 2));
                              LastCart.add(LastOrder(product: product, numOfItem: 2));
                            }
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}