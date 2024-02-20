import 'package:flutter/material.dart';
import 'package:smart/widgets/progress.dart';

class LoadBox extends StatelessWidget
{
  final String? message;
  LoadBox({this.message});


  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      key: key,
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          circularProgress(),
          SizedBox(height: 10,),
          Text(message! + ", Please wait...."),
        ],
      ),
    );
  }
}
