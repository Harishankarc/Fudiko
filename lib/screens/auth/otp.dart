import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class Otp extends StatelessWidget {
  const Otp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/otp.png',
              width: 180,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40,),
            AppText(text: "An OTP has been sent to your registered email address. Kindly enter it to continue.", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,isCentered: true,),
            SizedBox(height: 40,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: AppTextFeild()),
                SizedBox(width: 20,),
                Expanded(child: AppTextFeild()),
                SizedBox(width: 20,),
                Expanded(child: AppTextFeild()),
                SizedBox(width: 20,),
                Expanded(child: AppTextFeild()),
              ],
            ),
            SizedBox(height: 40,),
            AppButton(text: 'Verify', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}