import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:smart/widgets/text_field.dart';


class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  Query dbRef = FirebaseDatabase.instance.ref().child('users');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            CTextField(
              data: Icons.person,
              controller: nameController,
              hintText: "Yatharth",
              isObsecre: false,
              enabled: false,
            ),
            CTextField(
              data: Icons.email,
              controller: emailController,
              hintText: "yatharth@gmail.com",
              isObsecre: false,
              enabled: false,
            ),
            CTextField(
              data: Icons.phone,
              controller: phoneController,
              hintText: "6264842274",
              isObsecre: false,
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
