// ignore_for_file: library_prefixes, unused_local_variable, prefer_const_constructors

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart/Screens/successful_register.dart';
import 'package:smart/widgets/alert.dart';
import 'package:smart/widgets/loading.dart';
import 'package:smart/widgets/text_field.dart';
import 'package:firebase_storage/firebase_storage.dart' as fStorage;

import '../gobal/global.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp>
{
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController useremailController = TextEditingController();
  TextEditingController userpasswordController = TextEditingController();
  TextEditingController userconfirmController = TextEditingController();
  TextEditingController userphoneController = TextEditingController();
  TextEditingController userlocationController = TextEditingController();
  TextEditingController userconfirmPasswordController = TextEditingController();

  XFile? imageXFile;
  final ImagePicker _userpicker = ImagePicker();


  Position? position;
  List<Placemark>? placeMarks;

  String userImageURL = "";
  String userAddress = "";

  Future<void> _getImage() async
  {
    imageXFile = await _userpicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imageXFile;
    });
  }

  getCurrentLocation() async
  {
    LocationPermission permission = await Geolocator.requestPermission();
    Position newPosition=await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    position=newPosition;

    placeMarks=await placemarkFromCoordinates(
      position!.latitude,
      position!.longitude,
    );

    Placemark pMark = placeMarks![0];

    userAddress = '${pMark.subThoroughfare} ${pMark.thoroughfare} ${pMark.subLocality} ${pMark.locality}, ${pMark.subAdministrativeArea}, ${pMark.administrativeArea} ${pMark.postalCode}, ${pMark.country}';

    userlocationController.text = userAddress;
  }

  Future<void> validate() async
  {
    if(userpasswordController.text == userconfirmPasswordController.text)
      {
        if(userconfirmPasswordController.text.isNotEmpty && useremailController.text.isNotEmpty && usernameController.text.isNotEmpty && userphoneController.text.isNotEmpty && userlocationController.text.isNotEmpty)
        {
          // Upload Image
          showDialog(
              context: context,
              builder: (c)
              {
                return LoadBox(
                  message: "Registering",
                );
              }
          );
          String fileName = DateTime.now().microsecondsSinceEpoch.toString();
          fStorage.Reference reference = fStorage.FirebaseStorage.instance.ref().child("users").child(fileName);
          fStorage.UploadTask uploadTask = reference.putFile(File(imageXFile!.path));

          fStorage.TaskSnapshot taskSnapshot = await uploadTask.whenComplete(() {});
          await taskSnapshot.ref.getDownloadURL().then((url) {
            userImageURL = url;

            //Save information to FireBase
            validateAndRegister();
          });
        }
        else
        {
          showDialog(
              context: context,
              builder: (c)
              {
                return const AlertBox(
                  message: "Please provide required data for Registration.",
                );
              }
          );
        }
      }
      else{
        showDialog(
            context: context,
            builder: (c)
            {
              return const AlertBox(
                message: "Password does not match.",
              );
            }
        );
      }
  }

  Future<void> validateAndRegister() async
  {
    User? currentUser;

    await firebaseAuth.createUserWithEmailAndPassword(
      email: useremailController.text.trim(),
      password: userpasswordController.text.trim(),
    ).then((auth) {
      currentUser = auth.user;
    }).catchError((error){
      Navigator.pop(context);
      showDialog(
          context: context,
          builder: (c)
          {
            return AlertBox(
              message: error.message.toString(),
            );
          }
      );
    });

    if(currentUser != null)
    {
      saveData(currentUser!).then((value) {
        Navigator.pop(context);
        //Send to HomePage
        Route newRoute = MaterialPageRoute(builder: (c) => SignUpSuccess());
        Navigator.pushReplacement(context, newRoute);
      });
    }
  }

  Future saveData(User currentUser) async
  {
    FirebaseFirestore.instance.collection("users").doc(currentUser.uid).set({
      "userUID": currentUser.uid,
      "userEmail": currentUser.email,
      "userName": usernameController.text.trim(),
      "userProfileImage": userImageURL,
      "userPhoneNumber": userphoneController.text.trim(),
      "useraddress": userAddress,
      "userstatus": "approved",
      "lat": position!.latitude,
      "lng": position!.longitude,
    });
    //Save Locally
    sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences!.setString("uid", currentUser.uid);
    await sharedPreferences!.setString("useremail", currentUser.email.toString());
    await sharedPreferences!.setString("username", usernameController.text.trim());
    await sharedPreferences!.setString("userphotoUrl", userImageURL);


  }


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          const SizedBox(height: 10,),
          InkWell(
            onTap: (){
              _getImage();
            },
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.width * 0.20,
              backgroundImage: imageXFile==null ? null : FileImage(File(imageXFile!.path)),
              child: imageXFile == null ? Icon(Icons.add_photo_alternate, size: MediaQuery.of(context).size.width * 0.20,
                  color: Colors.grey) : null,
            ),
          ),
          const SizedBox(height: 10,),
          Form(
            key: _formkey,
            child: Column(
              children: [
                CTextField(
                  data: Icons.person,
                  controller: usernameController,
                  hintText: "Name",
                  isObsecre: false,
                ),
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
                CTextField(
                  data: Icons.lock,
                  controller: userconfirmPasswordController,
                  hintText: "Confirm Password",
                  isObsecre: true,
                ),
                CTextField(
                  data: Icons.phone,
                  controller: userphoneController,
                  hintText: "Phone",
                  isObsecre: false,
                ),
                CTextField(
                  data: Icons.my_location,
                  controller: userlocationController,
                  hintText: "Address",
                  isObsecre: false,
                  enabled: true,
                ),
                Container(
                  width : 400,
                  height: 40,
                  alignment: Alignment.center,
                  child: ElevatedButton.icon(
                    label: const Text(
                      "Get my Current location",
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(
                      Icons.location_on,
                      color: Colors.white,
                    ),
                    // ignore: avoid_print
                    onPressed: (){
                      getCurrentLocation();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
            ),
            // ignore: avoid_print
            onPressed: ()
            {
              validate();
            },
            child: const Text(
              "Continue",
              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),
            ),
          ),
        ],
      ),
    );
  }
}

