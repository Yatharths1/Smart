// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables, must_be_immutable, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/profile/components/order.dart';
import 'package:smart/widgets/size_config.dart';


class OrderCard extends StatelessWidget {
  OrderCard({super.key,
    required this.LastCart,
  });

  final LastOrder LastCart;
  late double b = 0.0;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    double a = (LastCart.numOfItem * LastCart.product.price);
    b = b + a;
    return Row(
      children: [
        SizedBox(
          width: 88,
          child: AspectRatio(
            aspectRatio: 0.88,
            child: Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(10)),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F6F9),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset(LastCart.product.images[0]),
            ),
          ),
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LastCart.product.title,
              style: const TextStyle(color: Colors.black, fontSize: 16),
              maxLines: 2,
            ),
            const SizedBox(height: 10),
            Text.rich(
              TextSpan(
                text: "Rs. ${LastCart.product.price}",
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Color(0xFFFF7643)),
                children: [
                  TextSpan(
                      text: " x ${LastCart.numOfItem}",
                      style: Theme.of(context).textTheme.bodyText1),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}