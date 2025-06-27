import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h,left: 30.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 30.w,
                    color: appTextColor3,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 60.h),
          Divider(color: appTextColor, thickness: 1, height: 20),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Remind new orders in every",
                      size: 15,
                      fontWeight: FontWeight.w500,
                      color: appTextColor3,
                    ),
                    AppText(
                      text: "10 Minutes",
                      size: 15,
                      color: appTextColor3,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSwitch(initialValue: true, onToggle: (val) {}),
              ],
            ),
          ),
          Divider(color: appTextColor, thickness: 1, height: 20),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppText(
                  text: "Party Order Notification",
                  size: 15,
                  fontWeight: FontWeight.w500,
                  color: appTextColor3,
                ),
                AppSwitch(initialValue: true, onToggle: (val) {}),
              ],
            ),
          ),
          Divider(color: appTextColor, thickness: 1, height: 20),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(
                      text: "Remind the confirmed orders",
                      size: 15,
                      fontWeight: FontWeight.w500,
                      color: appTextColor3,
                    ),
                    AppText(
                      text: "before 30 minutes ",
                      size: 15,
                      color: appTextColor3,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
                AppSwitch(initialValue: true, onToggle: (val) {}),
              ],
            ),
          ),
          Divider(color: appTextColor, thickness: 1, height: 20),

        ],
      ),
    );
  }
}
