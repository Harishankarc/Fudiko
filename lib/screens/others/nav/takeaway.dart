import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class TakeAway extends StatefulWidget {
  final VoidCallback? onDrawerTap;
  const TakeAway({super.key,this.onDrawerTap});

  @override
  State<TakeAway> createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {
  String selectedStatus = "All Orders";
  bool hasData = false;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,

      body: Stack(
        children: [
          Padding(
            padding:  EdgeInsets.only(top: 30.h),
            child: SingleChildScrollView(
              physics:  BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width.w,
                      decoration: BoxDecoration(
                        color: appSecondaryBackgroundColor,
                        borderRadius:  BorderRadius.only(
                          topLeft: Radius.circular(40.r),
                          topRight: Radius.circular(40.r),
                        ),
                      ),
                      child:  Center(child: Text("Helloo")),
                    ),
                  ),
                  Column(
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
                        child: Column(
                          children: [
                            Row(
                              children: [
                                buildStatusButton("All Orders"),
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
                                Container(
                                  height: 35.h,
                                  width: 50.w,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10.r),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.3),
                                        blurRadius: 6.r,
                                        offset:  Offset(2.r, 2.r),
                                      ),
                                    ],
                                  ),
                                  child: Icon(
                                    Icons.search,
                                    color: appTextColor3,
                                    size: 20.w,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      if (hasData)
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 20.w),
                          child: Column(
                            children: [
                              // Your orders here
                            ],
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          if (!hasData)  Center(child: Text("No orders yet")),


        ],
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
                ?  LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.r,
                offset:  Offset(2.r, 2.r),
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


}
