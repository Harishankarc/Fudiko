import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class InfoPage4 extends StatelessWidget {
  const InfoPage4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/checked.png',
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 20),
            AppText(text: "You're all set!", size: 25, fontWeight: FontWeight.bold),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: AppText(text: "Your details are under review.Once approved, you’ll be able to manage your orders, reach more food lovers.You're all set!", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,isCentered: true,),
            ),
          ],
        ),
      ),
    );
  }
}