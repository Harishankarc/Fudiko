import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40,left: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 30,
                  color: appTextColor3,
                ),
              ],
            ),
          ),
          SizedBox(height: 60),
          Divider(color: appTextColor, thickness: 1, height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
