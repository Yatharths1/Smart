import 'package:flutter/material.dart';
import 'package:smart/User_home/user_home.dart';
import 'package:smart/widgets/size_config.dart';


class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        leading: const SizedBox(),
        title: const Text("Successfully Registered"),
      ),
      body: Column(
        children: [
          SizedBox(height: SizeConfig.screenHeight * 0.04),
          Image.asset("images/success.png",
            height: SizeConfig.screenHeight * 0.4,
          ),
          SizedBox(height: SizeConfig.screenHeight * 0.08),
          Text("Successfully Registered",
            style: TextStyle(
              fontSize: getProportionateScreenWidth(30),
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const Spacer(),
          SizedBox(width: SizeConfig.screenWidth * 0.6),
          ElevatedButton(onPressed: (){ Navigator.pop(context);
          //Send to HomePage
          Route newRoute = MaterialPageRoute(builder: (c) => const UserHomeScreen());
          Navigator.pushReplacement(context, newRoute);
          }, child: const Text(
            "Continue to Home Page",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
          ),
          ),
        ],
      ),
    );
  }
}