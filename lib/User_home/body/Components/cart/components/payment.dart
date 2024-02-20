// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:smart/User_home/body/Components/cart/components/paysuccess.dart';


class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  int value =0;
  final _paymentLabels = [
    'Credit card / Debit card',
    'Cash on delivery',
    'Paypal',
    'Google wallet',
  ];
  final _paymentIcons = [
    Icons.credit_card,
    Icons.money_off,
    Icons.payment,
    Icons.account_balance_wallet,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Payment'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text('Choose Payment Method',
              style: TextStyle(fontSize: 25.0),),
          ),
          Expanded(
            child: ListView.separated(itemCount: _paymentLabels.length,
                itemBuilder: (context, index){
              return ListTile(
                leading: Radio(value: index,
                    groupValue: value,
                    onChanged: (i) => setState(() => value = i!),),
                title: Text(_paymentLabels[index]),
                trailing: Icon(_paymentIcons[index]),
              );
                },
                separatorBuilder: (context, index) {
              return Divider();
                } ),
          ),
          ElevatedButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (c) => PaySuccess()));
          }, child: Text('Pay'))
        ],
      ),
    );
  }
}
