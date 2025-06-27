import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/screens/others/scanner2.dart';
import 'package:fudiko/utils/constants.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTextColor2,
      body: Column(
        children: [
          Padding(
            padding:  EdgeInsets.all(30.r),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 30.w,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scanner2()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/scanner.png',
                      height: 300.h,
                      width: 300.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 50.h),
                  AppText(
                    text: "Scan the clients discount",
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  AppText(
                    text: "coupon here",
                    size: 16,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  SizedBox(height: 70.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_outlined, color: Colors.white, size: 30.w),
                      SizedBox(width: 40.w),
                      Icon(
                        Icons.flash_on_outlined,
                        color: Colors.white,
                        size: 30.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
