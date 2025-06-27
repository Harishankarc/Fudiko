import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/screens/others/infoPage4.dart';
import 'package:fudiko/utils/constants.dart';

class InfoPage3 extends StatefulWidget {
  const InfoPage3({super.key});

  @override
  State<InfoPage3> createState() => _InfoPage3State();
}

class _InfoPage3State extends State<InfoPage3> {
  bool banquetToggle = false;

  final List<String> distances = [
    'Up to 1 km',
    'Up to 2 km',
    'Up to 3 km',
    'Up to 4 km',
    'Up to 5 km',
    'Up to 6 km',
    'Up to 7 km',
    'Up to 8 km',
    'Up to 9 km',
    'Up to 10 km',
    'More than 10 km',
  ];
  bool isCheck = true;
  Set<String> selectedDistances = {'Up to 1 km'};

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Divider(color: appTextColor, thickness: 1, height: 20),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(text: "Banquet", size: 15, fontWeight: FontWeight.w500),
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
                      text: "Takeaway service",
                      size: 15,
                      fontWeight: FontWeight.w500,
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
                      text: "Delivery service",
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                    AppSwitch(initialValue: true, onToggle: (val) {}),
                  ],
                ),
              ),
               SizedBox(height: 16.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: _buildDistanceGrid(),
              ),
              Divider(color: appTextColor, thickness: 1, height: 20),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppText(
                      text: "Type of restaurant ",
                      size: 15,
                      fontWeight: FontWeight.w500,
                    ),
                  ],
                ),
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 60.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(text: "Pure Vegetarian", size: 15, fontWeight: FontWeight.bold,color: Colors.black,),
                        Checkbox(
                          value: isCheck,
                          onChanged: (bool? value) {},
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                          side: BorderSide.none,
                          checkColor: Colors.white,
                          activeColor: appToggleColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Non Vegetarian",
                          size: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),

                        Checkbox(
                          value: isCheck,
                          onChanged: (bool? value) {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          side: BorderSide.none,
                          checkColor: Colors.white,
                          activeColor: appToggleColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        AppText(
                          text: "Both Veg & Non-Veg",
                          size: 15,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),

                        Checkbox(
                          value: isCheck,
                          onChanged: (bool? value) {

                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          side: BorderSide.none,
                          checkColor: Colors.white,
                          activeColor: appToggleColor,
                          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(color: appTextColor, thickness: 1, height: 20),
              SizedBox(height: 60.h),
              Column(
                children: [
                  AppText(text: "By proceeding, you confirm that you have read, understood, and ", size: 12, fontWeight: FontWeight.w400, color: appLinkColor,isCentered: true,),
                  AppText(text: "agreed to our Terms and Conditions, Privacy Policy, and Vendor Agreement.", size: 12, fontWeight: FontWeight.w400, color: appLinkColor,isCentered: true,),
                  SizedBox(height: 5,),
                  AppText(text: "View Agreement", size: 12, fontWeight: FontWeight.bold, color: appLinkColor,isCentered: true,),
                ],
              ),
              SizedBox(height: 20.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 20.w),
                child: AppButton(text: 'Proceed', onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => InfoPage4()),
                    );
                }),
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDistanceGrid() {
    final left = distances.sublist(0, 5);
    final right = distances.sublist(5, 10);
    final last = distances[10];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: left.map(_buildCheckboxRow).toList(),
              ),
            ),
             SizedBox(width: 20.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: right.map(_buildCheckboxRow).toList(),
              ),
            ),
          ],
        ),
        _buildCheckboxRow(last),
      ],
    );
  }


  Widget _buildCheckboxRow(String text) {
    final isChecked = selectedDistances.contains(text);

    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 6.r),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(fontSize: 15.sp, color: appTextColor2)),
          SizedBox(width: 20.w),
          Container(
            width: 24.w,
            height: 24.h,
            decoration: BoxDecoration(
              color: isChecked ? appToggleColor : Colors.transparent,
              borderRadius: BorderRadius.circular(6.r),
              border: Border.all(color: appToggleColor, width: 2),
            ),
            child: Checkbox(
              value: isChecked,
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    selectedDistances.add(text);
                  } else {
                    selectedDistances.remove(text);
                  }
                });
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.r),
              ),
              side: BorderSide.none,
              checkColor: Colors.white,
              activeColor: appToggleColor,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }

}
