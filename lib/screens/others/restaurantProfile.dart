import 'package:flutter/material.dart';
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
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(40),
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
                                  size: 15,
                                  color: Colors.white,
                                ),
                                SizedBox(width: 5),
                                AppText(
                                  text: "Ulitsa Serpukhovskiy Val-14",
                                  size: 15,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Wrap(
                              children: List.generate(
                                5,
                                (index) => Icon(
                                  Icons.star,
                                  color: index < 3 ? Colors.white : Colors.grey,
                                  size: 20,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: -screenWidth / 6,
                        right: 20,
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              isProfileOpen = !isProfileOpen;
                            });
                          },
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: Offset(0, 4),
                                ),
                              ],
                            ),
                            padding: EdgeInsets.all(4),
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
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Image.asset(
                      'assets/images/verification.png',
                      height: 40,
                      width: 40,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 40),
                  SizedBox(
                    height: 150,
                    child: ListView.builder(
                      itemCount: 6,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (index < 5) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/restaurantPic.png',
                              height: 150,
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                          );
                        } else {
                          return Container(
                            height: 150,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(
                                Icons.add,
                                color: Colors.white,
                                size: 50,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.3),
                            blurRadius: 10,
                            offset: Offset(0, 4),
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
                                  size: 20,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.list, size: 20, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 10,
                              left: 30,
                              bottom: 5,
                            ),
                            child: AppText(
                              text:
                                  "Step into the glitz and glamour of Indian cinema at our uniquely designed restaurant where every corner tells a story. Enjoy delicious Indian cuisine in a vibrant atmosphere inspired by classic films, iconic stars, and colorful sets. Perfect for movie lovers, families, and anyone craving a little drama with their dinner!",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.fastfood,
                                size: 20,
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
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 10,
                              left: 30,
                              bottom: 5,
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
                              Icon(Icons.home, size: 20, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 10,
                              left: 30,
                              bottom: 5,
                            ),
                            child: AppText(
                              text:
                                  "Ultisa Serpukhovskiy Val- 14 , Near Street mall Cinema Hub, North Metro Moscow",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                            ),
                          ),
                          Row(
                            children: [
                              Icon(Icons.phone, size: 20, color: appTextColor3),
                              Expanded(
                                child: Container(
                                  height: 0.5,
                                  color: appTextColor3,
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 5,
                              right: 10,
                              left: 30,
                              bottom: 5,
                            ),
                            child: AppText(
                              text:
                                  "+7 9856412878    +7 895624158   +7 8565214589",
                              size: 12,
                              fontWeight: FontWeight.w400,
                              color: appTextColor2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 300,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: 150,
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: menuUploadBoxColor,
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 10,
                                    offset: Offset(0, 4),
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
                                    size: 30,
                                  ),
                                  SizedBox(height: 10),
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
                            SizedBox(height: 20),
                            SizedBox(
                              width: 150,
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
                              ),
                            ),
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
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Container(
                        height: 250,
                        width: double.infinity,
                        padding: const EdgeInsets.only(
                          left: 40,
                          right: 40,
                          top: 30,
                          bottom: 30,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.1),
                              blurRadius: 10,
                              offset: Offset(0, 4),
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
                                SizedBox(height: 20,),
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
