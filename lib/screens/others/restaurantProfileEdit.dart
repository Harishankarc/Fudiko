import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appdropdown.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/screens/others/restaurantBioPage.dart';

class RestaurantProfileEdit extends StatelessWidget {
  const RestaurantProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Image.asset(
                    'assets/images/banner1.png',
                    height: 150.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding:  EdgeInsets.all(30.w),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 30.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              ConstrainedBox(
                constraints: BoxConstraints(
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 50.h),

                      AppTextFeild(text: "Establishment Name"),
                      SizedBox(height: 20.h),
                      AppDropDown(
                        hint: 'Establishment type',
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
                              blurRadius: 10.r,
                              offset: Offset(0, 4.r),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.h),
                      AppTextFeild(text: "Location"),
                      SizedBox(height: 40.h),
                      Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 100.w),
                        child: AppButton(text: 'Add', onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => RestaurantBioEditPage(),
                              ),
                            );
                        }),
                      ),
                      SizedBox(height: 60.h),
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