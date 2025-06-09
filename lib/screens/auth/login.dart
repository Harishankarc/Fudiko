import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: screenWidth / 2),
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
                    AppTextFeild(text: "Username", icon: Icons.person),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Password", icon: Icons.lock),
                    SizedBox(height: 20),
                    AppButton(text: 'Login', onPressed: () {}),
                    SizedBox(height: 20),
                    AppText(
                      text: "Forget Password?",
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
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
                    text: "Dont have an Account?  ",
                    size: 15,
                    fontWeight: FontWeight.normal,
                    color: appTextColor2,
                  ),
                  AppText(
                    text: "Sign Up",
                    size: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ],
              ),
            ),
            SizedBox(height: screenWidth / 4),
          ],
        ),
      ),
    );
  }
}
