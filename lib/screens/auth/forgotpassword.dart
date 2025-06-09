import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AppText(
              text: "Enter your username and",
              size: 15,
              fontWeight: FontWeight.w400,
              color: appTextColor2,
            ),
            AppText(
              text: "registered email ID",
              size: 15,
              fontWeight: FontWeight.w400,
              color: appTextColor2,
            ),
            SizedBox(height: 40),
            AppTextFeild(text: "Username", icon: Icons.person),
            SizedBox(height: 20),
            AppTextFeild(text: "Email", icon: Icons.mail),
            SizedBox(height: 60),
            AppButton(text: 'Continue', onPressed: () {}),
            SizedBox(height: 20),


          ],
        ),
      ),
    );
  }
}
