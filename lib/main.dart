// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smart/User_home/body/Components/details.dart';
import 'package:smart/User_home/body/Components/profile/profilepage.dart';
import 'package:smart/gobal/global.dart';
import 'package:smart/splash/screen.dart';

Future<void> main() async
{
  WidgetsFlutterBinding.ensureInitialized();


  sharedPreferences = await SharedPreferences.getInstance();

  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seller',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartScreen(),

      routes: {
        DetailsScreen.routeName: (context) => DetailsScreen(),
        ProfileScreen.routeName: (context) => ProfileScreen(),
      },
    );
  }
}

