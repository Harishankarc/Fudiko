import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class Register extends StatelessWidget {
  const Register({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: screenWidth / 4),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logofudikoo.png',
                      width: 250,
                      fit: BoxFit.contain,
                    ),
                    AppText(
                      text: "PARTNER APP",
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: 60),
                    AppTextFeild(text: "Name", icon: Icons.person),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Email", icon: Icons.mail),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Password", icon: Icons.lock),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Confirm Password", icon: Icons.lock),
                    SizedBox(height: 40),
                    AppButton(text: 'Create Account', onPressed: () {}),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppText(
                    text: "Already have an Account?  ",
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: appTextColor2,
                  ),
                  AppText(
                    text: "Sign In",
                    size: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth/4),
          ],
        ),
      ),
    );
  }

}