// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables
// ignore_for_file: deprecated_member_use, prefer_const_constructors_in_immutables


import 'package:smart/User_home/body/Components/profile/components/order_body.dart';
import 'package:smart/User_home/body/Components/profile/components/order_repeat.dart';
import 'package:smart/User_home/body/products.dart';
import 'package:flutter/material.dart';
import 'package:smart/widgets/size_config.dart';


class MyOrder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: OrderBody(),
      bottomNavigationBar: const RepeatOrder(),
      );
  }
}


AppBar buildAppBar(BuildContext context) {
  return AppBar(
    title: Column(
      children: [
        Text(
          "Last Order",
          style: TextStyle(color: Colors.black),
        ),
      ],
    ),
  );
}





class LastOrder {
  final Product product;
  final int numOfItem;

  LastOrder({required this.product, required this.numOfItem});
}

// Demo data for our cart

List<LastOrder> LastCart = [
];