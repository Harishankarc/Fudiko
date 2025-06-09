import 'package:flutter/material.dart';
import 'package:fudiko/screens/auth/changepassword.dart';
import 'package:fudiko/screens/auth/forgotpassword.dart';
import 'package:fudiko/screens/auth/login.dart';
import 'package:fudiko/screens/auth/otp.dart';
import 'package:fudiko/screens/others/infoPage.dart';
import 'package:fudiko/screens/others/infoPage2.dart';
import 'package:fudiko/screens/others/infoPage3.dart';
import 'package:fudiko/screens/others/infoPage4.dart';
import 'package:fudiko/screens/others/nav/mainnav.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudiko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        scaffoldBackgroundColor: Colors.white
      ),
      home: const MainNavPage(),
    );
  }
}
