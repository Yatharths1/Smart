// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart/Screens/successful_login.dart';
import 'package:smart/User_home/Categories/beauty_prod.dart';
import 'package:smart/User_home/Categories/biscuits.dart';
import 'package:smart/User_home/Categories/cold_drinks.dart';
import 'package:smart/User_home/Categories/snacks.dart';
import 'package:smart/widgets/size_config.dart';


class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    List<Map<String, dynamic>> categories = [
      {"icon": "icons/snacks.svg", "text": "Snacks"},
      {"icon": "icons/cosmetics.svg", "text": "Beauty Products"},
      {"icon": "icons/bakery.svg", "text": "Biscuits"},
      {"icon": "icons/cd.svg", "text": "Cold Drinks"},
    ];
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          categories.length,
              (index) => CategoryCard(
            icon: categories[index]["icon"],
            text: categories[index]["text"],
                press: () {
                  if (categories[index]["text"] == "Snacks") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => Snacks()));
                  }
                  if (categories[index]["text"] == "Beauty Products") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => BeautyProducts()));
                  }
                  if (categories[index]["text"] == "Biscuits") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => Biscuits()));
                  }
                  if (categories[index]["text"] == "Cold Drinks") {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (c) => ColdDrinks()));
                  }
                },
          ),
        ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.icon,
    required this.text,
    required this.press,
  }) : super(key: key);

  final String? icon, text;
  final GestureTapCallback press;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: SizedBox(
        width: getProportionateScreenWidth(55),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(15)),
              height: getProportionateScreenWidth(55),
              width: getProportionateScreenWidth(55),
              decoration: BoxDecoration(
                color: const Color(0xFFFFECDF),
                borderRadius: BorderRadius.circular(10),
              ),
              child: SvgPicture.asset(icon!),
            ),
            const SizedBox(height: 5),
            Text(text!, textAlign: TextAlign.center)
          ],
        ),
      ),
    );
  }
}