import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/descriptionBox.dart';
import 'package:fudiko/utils/constants.dart';

class IndividualMenuUpload2 extends StatefulWidget {
  const IndividualMenuUpload2({super.key});

  @override
  State<IndividualMenuUpload2> createState() => _IndividualMenuUpload2State();
}

class _IndividualMenuUpload2State extends State<IndividualMenuUpload2> {
  int? selectedIndex;
  List<String> foodList = [
    "Starter",
    "Main Course",
    "Salad",
    "Drink",
    "Slides",
    "Grill & BBQ",
    "Desserts",
    "Continental",
    "Soups",
  ];

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
            SizedBox(height: 35.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Container(
                width: double.infinity,
                height: 120.h,
                padding:  EdgeInsets.all(10.w),
                decoration: BoxDecoration(
                  color: menuUploadBoxColor,
                  borderRadius: BorderRadius.circular(15.r),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10.r,
                      offset: Offset(0, 4.r),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: Colors.black,
                      size: 30.w,
                    ),
                    SizedBox(height: 10.h),
                    AppText(
                      text: "Click here to choose",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: appTextColor2,
                    ),
                    AppText(
                      text: "your image",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: appTextColor2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                children: [
                  AppTextFeild(
                    text: "Item Name",
                    icon: Icons.fastfood,
                    iconColor: Colors.black,
                  ),
                  SizedBox(height: 20.h),
                  DescriptionTextArea(
                    hintText: "Short Description",
                    icon: Icons.book,
                    iconColor: Colors.black,
                    maxLines: 3,
                    maxLength: 350,
                  ),
                  SizedBox(height: 20.h),
                  AppTextFeild(
                    text: "Price",
                    icon: Icons.money,
                    iconColor: Colors.black,
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Select Your Item Category",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      foodList.length,
                      (index) => _discountBox(
                        foodList[index],
                        selectedIndex == index,
                        () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: AppButton(text: "Add", onPressed: () {},size: 15,),
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _discountBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h ),
        decoration: BoxDecoration(
          color: isSelected ? appTextColor3 : Colors.grey.shade300,
          border: Border.all(
            color: !isSelected ? Colors.grey.shade300 : appTextColor3,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12.sp,
          ),
        ),
      ),
    );
  }
}
