import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class BanquetConfirmedBox extends StatelessWidget {
  const BanquetConfirmedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 20.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding:  EdgeInsets.all(20.w),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "P17854",
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: appTextColor3,
                        ),
                         SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.wallet_rounded,
                              color: appTextColor5,
                              size: 18.sp,
                            ),
                             SizedBox(width: 5),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '1200',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w900,
                                        color: appTextColor5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Per Person',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: appTextColor5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.local_offer,
                              color: appTextColor5,
                              size: 18,
                            ),
                             SizedBox(width: 5),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '5%',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: appTextColor5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' on extra drinks',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: appTextColor5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.groups, color: appTextColor5, size: 18),
                             SizedBox(width: 5),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '20',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w700,
                                        color: appTextColor5,
                                      ),
                                    ),
                                    TextSpan(
                                      text: ' Person',
                                      style: TextStyle(
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w500,
                                        color: appTextColor5,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                         SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.message,
                              color: appTextColor5,
                              size: 18,
                            ),
                             SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                '-------------------------',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor5,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                   SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: "Apr 11",
                        size: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                       SizedBox(height: 5),
                      AppText(
                        text: "12:30pm",
                        size: 10.sp,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                    ],
                  ),
                ],
              ),
               SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [

                      Icon(
                        Icons.person_search_sharp,
                        color: appLinkColor,
                        size: 20.sp,
                      ),
                      AppText(
                        text: "Details",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: appLinkColor,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 150.w,
                    height: 35.h,
                    child: AppButton(
                      text: "Remind",
                      onPressed: () {},
                      bgColor1: Colors.blue,
                      bgColor2: Colors.blue,
                      size: 12.sp,
                      borderRadius: 5.r,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
