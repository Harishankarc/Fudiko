import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/screens/others/infoPage2.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppTextFeild(text: "Establishment Name"),
                    SizedBox(height: 20.h),
                    AppDropDown(
                      hint: 'Establishment type',
                      toggleDropdown: (){
                        showModalBottomSheet(
                          backgroundColor: Colors.white,
                          context: context,
                          isScrollControlled: true,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(25.r),
                            ),
                          ),
                          builder: (context) {
                            return Padding(
                              padding:  EdgeInsets.all(30.r),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Container(
                                    width: 40.w,
                                    height: 5.h,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                   SizedBox(height: 16.h),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(20.r),
                                    ),
                                    padding:  EdgeInsets.all(16.r),
                                    child: Column(
                                      children: [
                                        Divider(color: Colors.grey[200]),
                                         SizedBox(height: 10.h),
                                        AppText(
                                          text: "item1",
                                          size: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                         SizedBox(height: 10.h),
                                        Divider(color: Colors.grey[200]),
                                         SizedBox(height: 10.h),
                                        AppText(
                                          text: "item2",
                                          size: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                         SizedBox(height: 10.h),
                                        Divider(color: Colors.grey[200]),
                                         SizedBox(height: 10.h),
                                        AppText(
                                          text: "item3",
                                          size: 15,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                         SizedBox(height: 10.h),
                                        Divider(color: Colors.grey[200]),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                    ),
                    SizedBox(height: 20.h),
                    Container(
                      height: 200.h,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppTextFeild(text: "Location"),
                    SizedBox(height: 40.h),
                    AppButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => InfoPage2()),
                        );
                      },
                    ),
                    SizedBox(height: 60.h), // Optional bottom spacing
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
