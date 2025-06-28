import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/screens/auth/login.dart';
import 'package:fudiko/screens/auth/otp.dart';
import 'package:fudiko/screens/others/nav/mainnav.dart';
import 'package:fudiko/screens/others/nav/offers/offers.dart';
import 'package:fudiko/screens/others/splashScreen.dart';
import 'package:fudiko/utils/constants.dart';

void main() {
   WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ScreenUtilInit(
      designSize: Size(402, 874),
      minTextAdapt: true,
      builder: (context,child)=> const MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudiko',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: appTextColor),
        scaffoldBackgroundColor: Colors.white,
        fontFamily: 'Inter',
      ),
      home: const SplashScreen(),
    );
  }
}
