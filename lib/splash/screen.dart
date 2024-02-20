import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smart/authentication/user_auth.dart';
import 'package:smart/User_home/user_home.dart';
import 'package:smart/gobal/global.dart';



class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  State<StartScreen> createState() => _StartScreenState();
}



class _StartScreenState extends State<StartScreen>
{
  
  timer()
  {
    Timer(const Duration(seconds: 6), () async{
      if(firebaseAuth.currentUser != null)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const UserHomeScreen()));
      }
      else
      {
        Navigator.push(context, MaterialPageRoute(builder: (c)=> const UserAuth()));
      }
    });
  }

  @override
  void initState() {
    super.initState();

    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset("images/splash.jpg"),

              const SizedBox(height: 10,),

              const Padding(
                padding: EdgeInsets.all(18.0),
                child: Text(
                  "Sell Food Online",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 40,
                    fontFamily: "Signatra",
                    letterSpacing: 3,

                  )
                )
              )
            ],
          )
        ),
      )
    );
  }
}

