import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/offercard.dart';
import 'package:fudiko/components/time.dart';
import 'package:fudiko/utils/constants.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final bool hasItem = true;
  bool isOpen = false; // for toggling open/close
  int? selectedPercentageIndex;
  int? selectedMenuIndex;
  int? selectedWeekIndex;

  // Checkbox states for dine in and take away
  bool isDineInChecked = false;
  bool isTakeAwayChecked = false;

  bool isDeletePressed = false;

  List<String> percentageList = [
    "10%",
    "15%",
    "20%",
    "25%",
    "30%",
    "35%",
    "40%",
    "45%",
    "50%",
    "55%",
    "60%",
    "Custom",
  ];
  List<String> menuList = ["Entire Menu", "Foods", "Drinks"];
  List<String> weekList = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      floatingActionButton: isOpen
          ? null
          : Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: IconButton(
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                icon: Icon(Icons.add, color: appButtonColor, size: 40),
              ),
            ),
      body: !isOpen
          ? Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
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
                                  size: 15,
                                  color: appTextColor3,
                                ),
                                SizedBox(width: 5),
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
                        Icon(Icons.menu, size: 30, color: appTextColor3),
                      ],
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      width: 250,
                      child: AppFilterDropDown(
                        items: ['Active', 'Inactive', 'Both Active & Inactive'],
                        hint: 'Both Active and Inactive',
                        icon: Icons.tune,
                      ),
                    ),
                    SizedBox(height: 20),
                    if (hasItem)
                      Column(
                        children: [
                          AppText(
                            text: "Total 6",
                            size: 15,
                            fontWeight: FontWeight.w500,
                            color: appTextColor2,
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: 6,
                            itemBuilder: (context, index) => OfferCard(
                              url: 'assets/images/discountbanner2.png',
                            ),
                          ),
                          AppText(
                            text: "Total 6",
                            size: 15,
                            fontWeight: FontWeight.w500,
                            color: appTextColor2,
                          ),
                        ],
                      )
                    else
                      Expanded(
                        child: Center(child: Text("No promotions  added")),
                      ),
                  ],
                ),
              ),
            )
          : _discountCreatePage(),
    );
  }

  Widget _discountCreatePage() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppText(
              text: "Add Promotions!",
              size: 25,
              fontWeight: FontWeight.w600,
              color: appTextColor3,
              isCentered: true,
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Discount Percentage",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor3,
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      percentageList.length,
                      (index) => _discountBox(
                        percentageList[index],
                        selectedPercentageIndex == index,
                        () {
                          setState(() {
                            selectedPercentageIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AppText(
                    text: "Which items does this offer apply to?",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor3,
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      menuList.length,
                      (index) => _discountBox(
                        menuList[index],
                        selectedMenuIndex == index,
                        () {
                          setState(() {
                            selectedMenuIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          AppText(
                            text: "Dine in",
                            size: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          Checkbox(
                            value: isDineInChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isDineInChecked = value ?? false;
                              });
                            },
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => appToggleColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(color: appToggleColor, width: 2),
                            checkColor: Colors.white,
                            activeColor: appToggleColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      SizedBox(width: 30),
                      Row(
                        children: [
                          AppText(
                            text: "Take away",
                            size: 15,
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                          ),
                          Checkbox(
                            value: isTakeAwayChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isTakeAwayChecked = value ?? false;
                              });
                            },
                            fillColor: MaterialStateColor.resolveWith(
                              (states) => appToggleColor,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            side: BorderSide(color: appToggleColor, width: 2),
                            checkColor: Colors.white,
                            activeColor: appToggleColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 30,
                        right: 30,
                        top: 20,
                        bottom: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  AppText(
                                    text: "Start time",
                                    fontWeight: FontWeight.w500,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Time(hours: "08", minutes: "30", amPm: "AM"),
                                ],
                              ),
                              Column(
                                children: [
                                  AppText(
                                    text: "End time",
                                    fontWeight: FontWeight.w500,
                                    size: 15,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Time(hours: "02", minutes: "00", amPm: "PM"),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              AppText(
                                text: "Active Days",
                                fontWeight: FontWeight.w500,
                                size: 15,
                                color: Colors.black,
                                isCentered: true,
                              ),
                              SizedBox(height: 10),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(
                                  weekList.length,
                                  (index) => _discountBox(
                                    weekList[index],
                                    selectedWeekIndex == index,
                                    () {
                                      setState(() {
                                        selectedWeekIndex = index;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  AppButton(
                    text: 'Create',
                    onPressed: () {
                      setState(() {
                        isOpen = !isOpen;
                      });
                    },
                    bgColor1: Colors.blue,
                    bgColor2: Colors.blueAccent,
                  ),
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
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? appTextColor3 : Colors.transparent,
          border: Border.all(color: appTextColor3, width: 1),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : appTextColor3),
        ),
      ),
    );
  }
}
