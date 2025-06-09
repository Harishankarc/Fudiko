import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

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
              text: "Set your new password",
              size: 15,
              fontWeight: FontWeight.w400,
              color: appTextColor2,
            ),

            SizedBox(height: 40),
            AppTextFeild(text: "New Password", icon: Icons.lock),
            SizedBox(height: 20),
            AppTextFeild(text: "Confirm Password", icon: Icons.lock),
            SizedBox(height: 60),
            AppButton(text: 'Update', onPressed: () {}),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
