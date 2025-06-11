import 'package:flutter/material.dart';
import 'package:fudiko/screens/auth/changepassword.dart';
import 'package:fudiko/screens/auth/forgotpassword.dart';
import 'package:fudiko/screens/auth/login.dart';
import 'package:fudiko/screens/auth/otp.dart';
import 'package:fudiko/screens/auth/registration.dart';
import 'package:fudiko/screens/auth/updatePassword.dart';
import 'package:fudiko/screens/others/about.dart';
import 'package:fudiko/screens/others/agreement.dart';
import 'package:fudiko/screens/others/contact.dart';
import 'package:fudiko/screens/others/establishmentSelect.dart';
import 'package:fudiko/screens/others/individualMenuUpload.dart';
import 'package:fudiko/screens/others/individualMenuUpload2.dart';
import 'package:fudiko/screens/others/infoPage.dart';
import 'package:fudiko/screens/others/infoPage2.dart';
import 'package:fudiko/screens/others/infoPage3.dart';
import 'package:fudiko/screens/others/infoPage4.dart';
import 'package:fudiko/screens/others/languages.dart';
import 'package:fudiko/screens/others/menuUpload.dart';
import 'package:fudiko/screens/others/nav/mainnav.dart';
import 'package:fudiko/screens/others/nav/offers.dart';
import 'package:fudiko/screens/others/notification.dart';
import 'package:fudiko/screens/others/restaurantBioPage.dart';
import 'package:fudiko/screens/others/restaurantProfile.dart';
import 'package:fudiko/screens/others/restaurantProfileEdit.dart';
import 'package:fudiko/screens/others/scanner.dart';
import 'package:fudiko/screens/others/scanner2.dart';
import 'package:fudiko/screens/others/services.dart';
import 'package:fudiko/screens/others/splashScreen.dart';
import 'package:fudiko/screens/others/totalOrders.dart';

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
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      home: const ContactPage(),
    );
  }
}
