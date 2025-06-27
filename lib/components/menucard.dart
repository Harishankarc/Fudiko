import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appswitch.dart';
import 'package:fudiko/components/apptext.dart';

class MenuCard extends StatelessWidget {
  final String url;

  const MenuCard({super.key, required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 20.h),
      padding:  EdgeInsets.all(8.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8.r,
            offset:  Offset(0, 2.r),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15.r),
            child: Image.asset(url, height: 120.h, width: 120.w, fit: BoxFit.cover),
          ),
           SizedBox(width: 16.w),
          Expanded(
            child: Stack(
              children: [

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Flexible(
                            flex: 3,
                            child: AppText(
                            text: "Chicken Biriyani",
                            size: 15,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,

                          ),),
                          Spacer(),
                          Flexible(
                            flex: 1,
                            child: AppSwitch(
                            initialValue: true,
                            onToggle: (val) {},
                          ),
                        )
                        ],
                      ),
                       SizedBox(height: 4.h),
                      AppText(
                        text: "650 ₽",
                        size: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                       SizedBox(height: 8.h),
                      AppText(
                        text:
                            "A fragrant and flavorful rice dish cooked with tender meat, aromatic spices, and herbs, offering a rich and royal taste in every bite",
                        size: 10,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                        lineSpacing: 1.2,
                      ),
                    ],
                  ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
