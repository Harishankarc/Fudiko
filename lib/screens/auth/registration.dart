import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/logofudikoo.png',
                  width: 250,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 10),
                const AppText(
                  text: "PARTNER APP",
                  size: 20,
                  fontWeight: FontWeight.w600,
                ),
                const SizedBox(height: 60),
                const AppTextFeild(text: "Name", icon: Icons.person),
                const SizedBox(height: 20),
                const AppTextFeild(text: "Email", icon: Icons.mail),
                const SizedBox(height: 20),
                const AppTextFeild(text: "Password", icon: Icons.lock),
                const SizedBox(height: 20),
                const AppTextFeild(text: "Confirm Password", icon: Icons.lock),
                const SizedBox(height: 40),
                AppButton(text: 'Create Account', onPressed: () {}),
                const SizedBox(height: 30),
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
                        color: Colors.blue, // Optional styling
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
