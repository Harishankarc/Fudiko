import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/completedBox.dart';
import 'package:fudiko/components/confirmedBox.dart';
import 'package:fudiko/components/processingbox.dart';
import 'package:fudiko/components/rejectedBox.dart';
import 'package:fudiko/utils/constants.dart';

class Reservation extends StatefulWidget {
  final VoidCallback? onDrawerTap;
  const Reservation({super.key, this.onDrawerTap});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  String selectedStatus = "Processing";
  String selectedStatusReason = "Date or Time is not available";
  bool isOpen = false;
  bool isSearchClicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,

      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 30.h),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Bollywood",
                              size: 35,
                              fontWeight: FontWeight.w600,
                              color: appTextColor3,
                            ),
                            AppText(
                              text: "Restaurant",
                              size: 25,
                              fontWeight: FontWeight.w600,
                              color: appTextColor3,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15.w,
                                  color: appTextColor3,
                                ),
                                 SizedBox(width: 5.w),
                                AppText(
                                  text: "Ulitsa Serpukhovskiy Val-14",
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor3,
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: widget.onDrawerTap,
                          child: Icon(
                            Icons.menu,
                            size: 30.w,
                            color: appTextColor3,
                          ),
                        ),
                      ],
                    ),
                  ),
                   SizedBox(height: 30.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: !isSearchClicked
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  buildStatusButton("Processing"),
                                   SizedBox(width: 10.w),
                                  buildStatusButton("Confirmed"),
                                ],
                              ),
                               SizedBox(height: 10.h),
                              Row(
                                children: [
                                  buildStatusButton("Completed"),
                                   SizedBox(width: 10.w),
                                  buildStatusButton("Rejected"),
                                   SizedBox(width: 10.w),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearchClicked = !isSearchClicked;
                                        selectedStatus = "Search";
                                      });
                                    },
                                    child: Container(
                                      height: 35.h,
                                      width: 50.w,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10.r),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.grey.withOpacity(0.3),
                                            blurRadius: 6,
                                            offset: const Offset(2, 2),
                                          ),
                                        ],
                                      ),
                                      child: Icon(
                                        Icons.search,
                                        color: appTextColor3,
                                        size: 20.w,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : AppTextFeild(
                            text: "Coupon Number",
                            icon: Icons.search,
                            size: 15,
                            iconColor: appButtonColor,
                          ),
                  ),
                   SizedBox(height: 30.h),
                  if (selectedStatus == "Processing")
                    buildList(
                      10,
                      ProcessingBox(
                        deleteOnPressed: () {
                          setState(() {
                            isOpen = !isOpen;
                          });
                        },
                      ),
                    )
                  else if (selectedStatus == "Confirmed")
                    buildList(5, const ConfirmedBox())
                  else if (selectedStatus == "Completed")
                    Column(
                      children: [
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: AppFilterDropDown(
                                  hint: "Last 7 days",
                                  icon: Icons.tune,
                                ),
                              ),
                            ],
                          ),
                        ),
                         SizedBox(height: 20.h),
                        buildList(3, const CompletedBox()),
                      ],
                    )
                  else if (selectedStatus == "Rejected")
                    buildList(1, const RejectedBox())
                  else
                    SizedBox.shrink(),
                ],
              ),
            ),
          ),
          if (isOpen)
            Positioned.fill(
              child: Container(
                alignment: Alignment.center,
                color: Colors.black.withOpacity(0.6),
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    width: double.infinity,
                    padding:  EdgeInsets.only(
                      left: 20.w,
                      right: 20.w,
                      top: 30.h,
                      bottom: 30.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding:  EdgeInsets.only(
                        top: 20.h,
                        bottom: 20.h,
                        left: 10.w,
                        right: 10.w,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          AppText(
                            text: "Reason",
                            size: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: appButtonColor2,
                            isCentered: true,
                          ),
                          SizedBox(height: 20.h),
                          Row(
                            children: [
                              buildReasonButton(
                                " Date or Time is not available",
                              ),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              buildReasonButton("Offer Expired"),
                               SizedBox(width: 10.w),
                              buildReasonButton("Not Valid"),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              buildReasonButton("Maximum Redemptions Reached"),
                            ],
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              buildReasonButton("Technical Issue"),
                               SizedBox(width: 10.w),
                              buildReasonButton("Not Opened"),
                            ],
                          ),
                          SizedBox(height: 25.h),
                          SizedBox(
                            height: 35.h,
                            child: AppButton(
                              text: "Cancel",
                              onPressed: () {},
                              bgColor1: Colors.blue,
                              bgColor2: Colors.blue,
                              size: 12,
                              borderRadius: 5,
                            ),
                          ),
                          SizedBox(height: 10.h),
                          SizedBox(
                            height: 35.h,
                            child: AppButton(
                              text: "Confirm Rejection",
                              onPressed: () {
                                setState(() {
                                  isOpen = !isOpen;
                                });
                              },
                              bgColor1: Colors.red,
                              bgColor2: Colors.red,
                              size: 12,
                              borderRadius: 5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget buildList(int count, Widget item) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: ListView.builder(
        itemCount: count,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => item,
      ),
    );
  }

  Widget buildStatusButton(String text) {
    final bool isSelected = selectedStatus == text;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = text;
          });
        },
        child: Container(
          height: 35.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : appTextColor3,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildReasonButton(String text) {
    final bool isSelected = selectedStatusReason == text;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatusReason = text;
          });
        },
        child: Container(
          height: 35.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                :  LinearGradient(colors: [Colors.grey[350]!, Colors.grey[350]!]),
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
