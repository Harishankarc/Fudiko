import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/donutPercentage.dart';
import 'package:fudiko/utils/constants.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  'assets/images/banner1.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: -screenWidth / 6,
                  left: screenWidth/2 - 75,
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white, // White background
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.all(4), // Optional: spacing around image
                    child: ClipOval(
                      child: Image.asset(
                        'assets/images/avatar2.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 80,),
            AppText(text: "John Abraham", size: 20, fontWeight: FontWeight.w600, color: Colors.black, isCentered: true,),
            SizedBox(height: 10,),
            SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/badge.png',
                    height: 30,
                    width: 30,
                    fit: BoxFit.contain,
                  )
                ],
              ),
            ),

            SizedBox(
              width: 250,
              height: 250,
              child: DonutChart(percentage: 72/100),
            ),
            AppText(text: "Reliability Rating", size: 15, fontWeight: FontWeight.w600, color: appTextColor3, isCentered: true,),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 20,
                bottom: 20,
              ),
              child: Container(
                padding: const EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.3),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        AppText(text: "Place", size: 12, fontWeight: FontWeight.w600, color: appTextColor2,),
                        SizedBox(width:15,),
                        Expanded(
                          child: Container(height: 0.5, color: appTextColor3),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 10,
                        left: 30,
                        bottom: 5,
                      ),
                      child: AppText(
                        text: "Tulskaya",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: appTextColor2,
                      ),
                    ),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        AppText(
                          text: "Email",
                          size: 12,
                          fontWeight: FontWeight.w600,
                          color: appTextColor2,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Container(height: 0.5, color: appTextColor3),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 10,
                        left: 30,
                        bottom: 5,
                      ),
                      child: AppText(
                        text: "abcdefg@gmai.com",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: appTextColor2,
                      ),
                    ),
                    SizedBox(height: 5),

                    Row(
                      children: [
                        AppText(
                          text: "Contact Info",
                          size: 12,
                          fontWeight: FontWeight.w600,
                          color: appTextColor2,
                        ),
                        SizedBox(width: 15),
                        Expanded(
                          child: Container(height: 0.5, color: appTextColor3),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),

                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5,
                        right: 10,
                        left: 30,
                        bottom: 5,
                      ),
                      child: AppText(
                        text:
                            "+7 9856412878    +7 895624158",
                        size: 12,
                        fontWeight: FontWeight.w400,
                        color: appTextColor2,
                      ),
                    ),
                    SizedBox(height: 5),

                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
