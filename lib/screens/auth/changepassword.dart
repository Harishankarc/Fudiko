import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/screens/auth/login.dart';
import 'package:fudiko/utils/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            AppText(
              text: "Set your new password",
              size: 15,
              fontWeight: FontWeight.w400,
              color: appTextColor2,
            ),

            SizedBox(height: 40.h),
            AppTextFeild(text: "New Password", icon: Icons.lock),
            SizedBox(height: 20.h),
            AppTextFeild(text: "Confirm Password", icon: Icons.lock),
            SizedBox(height: 30.h),
            AppButton(text: 'Update', onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
            }),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
