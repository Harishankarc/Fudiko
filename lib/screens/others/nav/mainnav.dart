import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/bottomnav.dart';
import 'package:fudiko/screens/auth/changepassword.dart';
import 'package:fudiko/screens/auth/login.dart';
import 'package:fudiko/screens/others/about.dart';
import 'package:fudiko/screens/others/agreement.dart';
import 'package:fudiko/screens/others/badgeInfo.dart';
import 'package:fudiko/screens/others/contact.dart';
import 'package:fudiko/screens/others/languages.dart';
import 'package:fudiko/screens/others/nav/banquet.dart';
import 'package:fudiko/screens/others/nav/offers/offers.dart';
import 'package:fudiko/screens/others/nav/profile.dart';
import 'package:fudiko/screens/others/nav/reservation.dart';
import 'package:fudiko/screens/others/nav/takeaway.dart';
import 'package:fudiko/screens/others/notification.dart';
import 'package:fudiko/screens/others/scanner.dart';
import 'package:fudiko/screens/others/services.dart';
import 'package:fudiko/screens/others/totalOrders.dart';
import 'package:fudiko/utils/constants.dart';

class MainNavPage extends StatefulWidget {
  const MainNavPage({super.key});

  @override
  State<MainNavPage> createState() => _MainNavPageState();
}

class _MainNavPageState extends State<MainNavPage> {
  int currentIndex = 0;
  bool isDrawerOpen = false;
  late List<Widget> screens;

  @override
  void initState() {
    super.initState();
  }

  void onTabChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    screens = [
      Reservation(
        onDrawerTap: () {
          setState(() {
            isDrawerOpen = !isDrawerOpen;
          });
        },
      ),
      Banquet(
        onDrawerTap: () {
          setState(() {
            isDrawerOpen = !isDrawerOpen;
          });
        },
      ),
      Offers(
        onDrawerTap: () {
          setState(() {
            isDrawerOpen = !isDrawerOpen;
          });
        },
      ),
      TakeAway(
        onDrawerTap: () {
          setState(() {
            isDrawerOpen = !isDrawerOpen;
          });
        },
      ),
      Profile(),
    ];
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Bottomnav(
          selectedIndex: currentIndex,
          onTabSelected: onTabChanged,
        ),
        floatingActionButton: currentIndex == 2
            ? null
            : GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Scanner()),
                  );
                },
                child: Container(
                  height: 60.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Image.asset(
                      'assets/images/scanner2.png',
                      height: 60.h,
                      width: 60.w,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
        body: Stack(
          children: [
            screens[currentIndex],
            if (isDrawerOpen)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isDrawerOpen = false;
                    });
                  },
                  child: Container(color: Colors.black.withOpacity(0.4)),
                ),
              ),

            AnimatedPositioned(
              duration: const Duration(milliseconds: 300),
              top: 0,
              bottom: 0,
              right: isDrawerOpen
                  ? 0
                  : -MediaQuery.of(context).size.width * 0.75,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.75,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(-4, 0),
                    ),
                  ],
                ),
                child: SafeArea(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 100.h),
                          AppText(
                            text: "Settings",
                            size: 15,
                            fontWeight: FontWeight.w600,
                            color: appTextColor2,
                          ),
                          SizedBox(height: 10.h),
                          Divider(thickness: 1, color: Colors.grey, height: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Change Password",
                                  Icons.lock,
                                  ChangePassword(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Notifications",
                                  Icons.notifications,
                                  NotificationPage(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Languages",
                                  Icons.translate,
                                  Languages(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Analytics",
                                  Icons.analytics,
                                  TotalOrders(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Service",
                                  Icons.handyman,
                                  ServicePage(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Promotions",
                                  Icons.campaign_outlined,
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),

                          SizedBox(height: 50.h),
                          AppText(
                            text: "Information",
                            size: 15,
                            fontWeight: FontWeight.w600,
                            color: appTextColor2,
                          ),
                          SizedBox(height: 10.h),
                          Divider(thickness: 1, color: Colors.grey, height: 1),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Column(
                              children: [
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "About the App",
                                  Icons.info,
                                  AboutPage(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Badge Earnings",
                                  Icons.shield,
                                  BadgeInfo(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Documentation",
                                  Icons.receipt_long,
                                  AgreementPage(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Support",
                                  Icons.support_agent,
                                  ContactPage(),
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.grey,
                                  height: 1,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 50.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.h),
                            child: Column(
                              children: [
                                Divider(
                                  thickness: 1,
                                  color: Colors.red,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                                _drawerItem(
                                  "Log Out",
                                  Icons.logout,
                                  Login(),
                                  Colors.red,
                                ),
                                SizedBox(height: 10.h),
                                Divider(
                                  thickness: 1,
                                  color: Colors.red,
                                  height: 1,
                                ),
                                SizedBox(height: 10.h),
                              ],
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
      ),
    );
  }

  Widget _drawerItem(
    String text,
    IconData icon, [
    Widget? routeWidget,
    Color? color,
  ]) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isDrawerOpen = false;
        });

        Future.delayed(Duration(milliseconds: 100), () {
          if (routeWidget != null) {
            if (routeWidget is Login) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => routeWidget),
                (route) => false,
              );
            } else {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => routeWidget),
              );
            }
          }
        });
      },
      child: Row(
        children: [
          Icon(icon, size: 20.w, color: color ?? appTextColor2),
          SizedBox(width: 10.w),
          AppText(
            text: text,
            size: 15,
            fontWeight: FontWeight.w500,
            color: color ?? appTextColor2,
          ),
        ],
      ),
    );
  }
}
