import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart/Screens/successful_login.dart';
import 'package:smart/gobal/global.dart';
import 'package:smart/widgets/alert.dart';
import 'package:smart/widgets/loading.dart';
import 'package:smart/widgets/text_field.dart';

class UserSignInInfo extends StatefulWidget {
  const UserSignInInfo({Key? key}) : super(key: key);

  @override
  State<UserSignInInfo> createState() => _UserSignInInfoState();
}

class _UserSignInInfoState extends State<UserSignInInfo>
{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();


  formValidation()
  {
    if(useremailController.text.isNotEmpty && userpasswordController.text.isNotEmpty)
    {
      //login
      loginNow();
    }
    else
    {
      showDialog
        (
          context: context,
          builder: (c)
          {
            return const AlertBox(message: "Please write email/password.",);
          }
      );
    }
  }

  loginNow() async
  {
    showDialog
      (
        context: context,
        builder: (c)
        {
          return LoadBox(message: "Checking Credentials.",);
        }
    );

    User? currentUser;
    await firebaseAuth.signInWithEmailAndPassword
      (
        email: useremailController.text.trim(),
        password: userpasswordController.text.trim()
    ).then((auth)
    {
      currentUser = auth.user!;
    }).catchError((error)
    {
      Navigator.pop(context);
      showDialog
        (
          context: context,
          builder: (c)
          {
            return AlertBox(message: error.message.toString(),);
          }
      );
    });
    if(currentUser != null)
    {
      readData(currentUser!).then((value)
      {
        Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginSuccess()));
      });
    }
  }

  Future readData(User currentUser) async
  {
    await FirebaseFirestore.instance.collection("users").doc(currentUser.uid)
        .get().then((snapshot) async
    {
      await sharedPreferences!.setString("uid", currentUser.uid);
      await sharedPreferences!.setString("useremail", snapshot.data()!["userEmail"]);
      await sharedPreferences!.setString("username", snapshot.data()!["userName"]);
      await sharedPreferences!.setString("userphotoUrl", snapshot.data()!["userProfileImage"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            child: Padding(
                padding: const EdgeInsets.all(15),
                child : Image.asset(
                  "images/buyer.png",
                  height: 270,
                )
            ),
          ),
          Form(
            key : _formkey,
            child: Column(
              children: [
                CTextField(
                  data: Icons.email,
                  controller: useremailController,
                  hintText: "E-mail",
                  isObsecre: false,
                ),
                CTextField(
                  data: Icons.lock,
                  controller: userpasswordController,
                  hintText: "Password",
                  isObsecre: true,
                ),
              ],
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            ),
            onPressed: ()
            {
              formValidation();
            },
            // ignore: avoid_print
            child: const Text(
              "Login",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          ),
          const SizedBox(height: 30,),
        ],
      ),
    );
  }
}

