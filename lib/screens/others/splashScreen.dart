import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/Splashpage.png',
      fit: BoxFit.cover,
    );
  }
}