import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/screens/others/individualMenuUpload.dart';
import 'package:fudiko/screens/others/menuUpload.dart';
import 'package:fudiko/screens/others/restaurantProfileEdit.dart';
import 'package:fudiko/utils/constants.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({super.key});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  bool isProfileOpen = false;
  bool isButtonOpen = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Image.asset(
                        'assets/images/banner1.png',
                        height: 200.h,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding:  EdgeInsets.all(30.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Bollywood",
                              size: 35,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            AppText(
                              text: "Restaurant",
                              size: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 15.w,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5.w),
                                AppText(
                                  text: "Ulitsa Serpukhovskiy Val-14",
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < 3 ? Colors.white : Colors.grey,
                                  size: 20.w,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -screenWidth / 6.w,
                        right: 20.w,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isProfileOpen = !isProfileOpen;
                            });
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10.r,
                                  offset: Offset(0, 4.r),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(4.r),
                            child: ClipOval(
                              child: Image.asset(
                                'assets/images/restaurantLogo.png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:  EdgeInsets.only(left: 40.w),
                    child: Image.asset(
                      'assets/images/verification.png',
                      height: 40.h,
                      width: 40.w,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 40.h),
                  SizedBox(
                    height: 150.h,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < 5) {
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.asset(
                                'assets/images/restaurantPic.png',
                                height: 150.h,
                                width: 100.w,
                                fit: BoxFit.cover,
                              ),
                            )
                          );
                        } else {
                          return Container(
                            height: 150.h,
                            width: 100.w,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50.w,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(20.w),
                    child: Container(
                      padding:  EdgeInsets.all(16.w),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10.r,
                            offset: Offset(0, 4.r),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> RestaurantProfileEdit()));
                                },
                                child: Icon(
                                  Icons.edit_square,
                                  size: 20.w,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.list, size: 20.w, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 5.h,
                              right: 10.w,
                              left: 30.w,
                              bottom: 5.h,
                            ),
                            child: AppText(
                              text:
                                  "Step into the glitz and glamour of Indian cinema at our uniquely designed restaurant where every corner tells a story. Enjoy delicious Indian cuisine in a vibrant atmosphere inspired by classic films, iconic stars, and colorful sets. Perfect for movie lovers, families, and anyone craving a little drama with their dinner!",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                              lineSpacing: 1.2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fastfood,
                                size: 20.w,
                                color: appTextColor3,
                              ),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 5.h,
                              right: 10.w,
                              left: 30.w,
                              bottom: 5.h,
                            ),
                            child: AppText(
                              text: "Chineese, Arabic, Indian,",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.home, size: 20.w, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 5.h,
                              right: 10.w,
                              left: 30.w,
                              bottom: 5.h,
                            ),
                            child: AppText(
                              text:
                                  "Ultisa Serpukhovskiy Val- 14 , Near Street mall Cinema Hub, North Metro Moscow",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                              lineSpacing: 1.2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 20.w, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:  EdgeInsets.only(
                              top: 5.h,
                              right: 10.w,
                              left: 30.w,
                              bottom: 5.h,
                            ),
                            child: AppText(
                              text:
                                  "+7 9856412878    +7 895624158   +7 8565214589",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                              lineSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 20.w,
                      vertical: 20.h,
                    ),
                    child: AppButton(
                      text: "Add Menu",
                      onPressed: () {
                        setState(() {
                          isButtonOpen = !isButtonOpen;
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
            if (isProfileOpen)
              Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: double.infinity,
                                height: 150.h,
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
                            SizedBox(height: 20.h),
                            SizedBox(
                              width: 150.w,
                              height: 50.h,
                              child: AppButton(
                                text: 'Upload',
                                size: 15,
                                onPressed: () {
                                  setState(() {
                                    isProfileOpen = !isProfileOpen;
                                  });
                                },
                                bgColor1: Colors.green,
                                bgColor2: Colors.green,
                                borderRadius: 10.r,
                              ),
                            ),
                            SizedBox(height: 20.h),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            if (isButtonOpen)
              Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    color: Colors.black.withOpacity(0.6),
                  ),
                  Center(
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 30.w),
                      child: Container(
                        height: 250.h,
                        width: double.infinity,
                        padding:  EdgeInsets.only(
                          left: 40.w,
                          right: 40.w,
                          top: 30.h,
                          bottom: 30.h,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
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
                          children: [
                            Column(
                              children: [
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    text: 'Add Entire Menu',
                                    size: 15,
                                    onPressed: () {
                                      setState(() {
                                        isButtonOpen = !isButtonOpen;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                MenuUpload(),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                                SizedBox(height: 20.h,),
                                SizedBox(
                                  width: double.infinity,
                                  child: AppButton(
                                    text: 'Add Individual Items',
                                    size: 15,
                                    onPressed: () {
                                      setState(() {
                                        isButtonOpen = !isButtonOpen;
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                IndividualMenuUpload(),
                                          ),
                                        );
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
