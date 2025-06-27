import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/orderDonut.dart';
import 'package:fudiko/utils/constants.dart';

class TotalOrders extends StatelessWidget {
  const TotalOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding:  EdgeInsets.only(top: 40.h),
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
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200.w),
                child: AppFilterDropDown(
                  hint: "This Month",
                  icon: Icons.tune,
                  toogleDropdown: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      shape:  RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.r),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding:  EdgeInsets.all(30.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                padding:  EdgeInsets.all(16.w),
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
              ),
              SizedBox(height: 45.h),
              AppText(
                text: "TOTAL ORDERS",
                size: 20,
                fontWeight: FontWeight.w600,
                isCentered: true,
              ),
              SizedBox(height: 10.h),
              AppText(
                text: "387",
                size: 40,
                fontWeight: FontWeight.w600,
                isCentered: true,
                color: appTextColor3,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: 200,
                height: 200,
                child: OrderDonut(done: 291, total: 387),
              ),
              SizedBox(height: 10.h),
              AppText(
                text: "Completed",
                size: 20,
                fontWeight: FontWeight.w400,
                isCentered: true,
                color: appTextColor2,
              ),
              SizedBox(height: 40.h),
              SizedBox(
                width: 200.w,
                height: 200.h,
                child: OrderDonut(
                  done: 87,
                  total: 387,
                  mainColor: Colors.green,
                  secondaryColor: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 10.h),
              AppText(
                text: "Cancelled",
                size: 20,
                fontWeight: FontWeight.w400,
                isCentered: true,
                color: appTextColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
