import 'package:flutter/material.dart';
import 'package:smart/authentication/otp/otp_form.dart';
import 'package:smart/widgets/size_config.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("OTP Verification"),
      ),
      body: SizedBox(
        width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
            child: SingleChildScrollView(child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.05),
                const Text("OTP Verification",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    color: Colors.black,
                    height: 1.5,
                  ),
                ),
                const Text("We sent your code to +1 898 860 ***"),
                buildTimer(),
                SizedBox(height: SizeConfig.screenHeight * 0.15),
                const OtpForm(),
                SizedBox(height: SizeConfig.screenHeight * 0.1),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                },
                  child: const Text(
                    "Resend OTP Code",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
          ),
      ),
    ),
      ),
      );
  }

  Row buildTimer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("This code will expired in"),
        TweenAnimationBuilder(tween: Tween (begin: 30.0, end: 0),
          duration: const Duration(seconds: 30),
          builder: (context, value, child) => Text("00:${value.toInt ()}",
            style: const TextStyle(color: Colors.orange),
          ),
          onEnd: (){},
        )
      ],
    );
  }
}



