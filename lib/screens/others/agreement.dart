import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/utils/constants.dart';

class AgreementPage extends StatelessWidget {
  const AgreementPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding:  EdgeInsets.only(left: 30.w, top: 10.h),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28.w,
                  ),
                ),
              ),
            ),
             SizedBox(height: 30.h),
             Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  'Agreement',
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ),
            ),
             SizedBox(height: 20.h),
            Expanded(
              child: Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: Scrollbar(
                  thumbVisibility: true,
                  radius:  Radius.circular(10.r),
                  thickness: 3,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:  [
                        Text(
                          'By registering on the Fudikoo Vendor App, you agree to enter into a partnership with Fudikoo under the terms and conditions outlined in this Agreement.',
                          style: TextStyle(fontSize: 15.sp, height: 1.6),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Fudikoo provides a platform that allows restaurants and food vendors to publish special offers, manage banquet bookings, accept takeaway orders, and connect with customers efficiently. As a vendor, you are responsible for accurately publishing offers, fulfilling customer orders, responding to banquet inquiries, and maintaining high-quality service standards. You agree to keep your business legal, operational licenses, and food safety certifications updated at all times.',
                          style: TextStyle(fontSize: 15.sp, height: 1.6),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Fudikoo will offer you access to powerful tools to promote your restaurant, manage orders, and communicate with customers. Based on your activity and performance, you will be eligible to earn badges that highlight your strengths, such as Early Bird, Restoday, Rainbow, and more. Upon achieving certain badges, you may receive special rewards from Fudikoo, including appreciation certificates, city trips, free promotions, and other exciting benefits. Fudikoo reserves the right to verify your achievements before distributing any rewards.',
                          style: TextStyle(fontSize: 15.sp, height: 1.6),
                        ),
                        SizedBox(height: 12.h),
                        Text(
                          'Vendors acknowledge that Fudikoo may charge service fees or commissions for completed orders or banquet deals, and vendors are responsible for providing accurate settlement details. Any concerns regarding payments must be reported within seven (7) days. Vendors who achieve high standards may also receive additional visibility through free or paid promotions within the app.',
                          style: TextStyle(fontSize: 15.sp, height: 1.6),
                        ),
                        SizedBox(height: 40.h),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }
}
