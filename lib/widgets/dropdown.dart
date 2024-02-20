import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:smart/widgets/service.dart';

class DropDown extends StatefulWidget {
  const DropDown({Key? key}) : super(key: key);

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  var my_services;

  void _onclicked(val){
  print("Value: " + val);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "CodingMSTR.com",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.normal,
                fontSize: 18),
          ),
        ),
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: Container(
                  height: 50,
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10.0, top: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.blue),
                  ),
                  child: Center(
                    child: DropdownButton<String>(
                        hint: const Text('Choose Option'),
                        elevation: 16,
                        isExpanded: true,
                        style:
                        const TextStyle(color: Colors.black, fontSize: 16.0),
                        onChanged: (String? changedValue) {
                          my_services = changedValue;
                          setState(() {
                            my_services;
                            _onclicked(my_services);
                          });
                        },
                        value: my_services,
                        items:
                        ServiceList.serviceOptions().map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList()),
                  ),
                ),
              ),
            ]));
  }
}
