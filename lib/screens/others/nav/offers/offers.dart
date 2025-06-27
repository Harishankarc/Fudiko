import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/offercard.dart';
import 'package:fudiko/components/time.dart';
import 'package:fudiko/models/offer/offer-create-model.dart';
import 'package:fudiko/models/offer/offer-list-model.dart';
import 'package:fudiko/models/offer/offer-return-model.dart';
import 'package:fudiko/screens/others/restaurantProfile.dart';
import 'package:fudiko/services/offer-service.dart';
import 'package:fudiko/utils/constants.dart';
import 'package:fudiko/utils/tokens.dart';

class Offers extends StatefulWidget {
  final VoidCallback? onDrawerTap;
  const Offers({super.key, this.onDrawerTap});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final bool hasItem = true;
  bool isOpen = false;
  int? selectedPercentageIndex;
  int? selectedMenuIndex;
  List<int> selectedWeekIndices = [];
  bool isDineInChecked = false;
  bool isTakeAwayChecked = false;
  List<OfferModel> offerList = [];
  bool isDeletePressed = false;
  bool isLoading = false;
  TimeOfDay startTime = TimeOfDay(hour: 8, minute: 30);
  TimeOfDay endTime = TimeOfDay(hour: 14, minute: 0);
  String selectedOption = "Both Active & InActive";
  TextEditingController customPercentageController = TextEditingController();
  OfferService offerService = OfferService();
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

  @override
  void initState() {
    getOffers();
    super.initState();
  }

  Future<void> getOffers() async {
    setState(() {
      isLoading = true;
      offerList = [];
    });

    print("Selectd Option: $selectedOption");
    if(selectedOption == "Active"){
      OfferListResponse response = await offerService.getActiveOffers();
      setState(() {
        offerList = response.offers;
        isLoading = false;
      });
    }else if(selectedOption == "InActive"){
      OfferListResponse response = await offerService.getInActiveOffers();
      setState(() {
        offerList = response.offers;
        isLoading = false;
      });

    }else{
      OfferListResponse response = await offerService.getAllOffers();
      setState(() {
        offerList = response.offers;
        isLoading = false;
      });
    }

    print(offerList);
  }

  Future<void> createOffer() async {
    String? discountPercentage;
    if (selectedPercentageIndex == percentageList.length - 1) {
      discountPercentage = customPercentageController.text;
      if (int.parse(discountPercentage) > 100) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Select a percentage less than 100")),
        );
        return;
      }
    } else {
      discountPercentage = percentageList[selectedPercentageIndex!].substring(
        0,
        2,
      );
    }

    //Get items
    List<Map<String, dynamic>> menuOptions = [
      {"selected": "Entire Menu", "value": "entire_menu"},
      {"selected": "Foods", "value": "foods"},
      {"selected": "Drinks", "value": "drinks"},
    ];
    String? applicableFor;
    for (var item in menuOptions) {
      if (item['selected'] == menuList[selectedMenuIndex!]) {
        applicableFor = item['value'];
      }
    }

    //select dine type
    List? dineTypeArr;
    String? dineType;
    if (isDineInChecked && isTakeAwayChecked) {
      dineTypeArr = ["Dine In", "Take Away"];
    } else if (isDineInChecked) {
      dineTypeArr = ["Dine In"];
    } else if (isTakeAwayChecked) {
      dineTypeArr = ["Take Away"];
    }

    if (dineTypeArr != null) {
      dineType = dineTypeArr.join(",");
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Select dine type")));
      return;
    }

    //Get start time
    String startTimeString = formatTimeOfDay(startTime);

    //Get end time
    String endTimeString = formatTimeOfDay(endTime);

    //Get Active days
    List<String> activeDays = selectedWeekIndices
        .map((i) => weekList[i])
        .toList();
    String activeDaysString = activeDays.join(',');

    if (discountPercentage.isNotEmpty &&
        applicableFor!.isNotEmpty &&
        dineType.isNotEmpty &&
        startTimeString.isNotEmpty &&
        endTimeString.isNotEmpty &&
        activeDaysString.isNotEmpty) {
      CreateOfferModel offerModel = CreateOfferModel(
        discountPercentage: discountPercentage,
        applicableFor: applicableFor,
        dineType: dineType,
        startTime: startTimeString,
        endTime: endTimeString,
        activeDays: activeDaysString,
      );
      OfferReturnModel response = await offerService.createOffer(offerModel);
      if (response.status) {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.message)));
        setState(() {
          isOpen = !isOpen;
        });
      } else {
        if (!mounted) return;
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(response.message)));
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Fill all the fields")));
    }

    setState(() {
      isLoading = true;
      offerList = [];
      selectedOption = "Both Active & InActive";
    });

    OfferListResponse response = await offerService.getAllOffers();
    setState(() {
      offerList = response.offers;
      isLoading = false;
    });


  }

  @override
  void dispose() {
    customPercentageController.dispose();
    super.dispose();
  }

  String formatTimeOfDay(TimeOfDay time) {
    final int hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final String paddedHour = hour.toString().padLeft(2, '0');
    final String paddedMinute = time.minute.toString().padLeft(2, '0');
    final String period = time.period == DayPeriod.am ? "AM" : "PM";
    return '$paddedHour:$paddedMinute $period';
  }

  Future<void> _selectTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime ? startTime : endTime,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: appButtonColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  Future<void> _showCustomPercentageDialog() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: Text('Custom Percentage'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Enter your custom discount percentage:'),
                SizedBox(height: 10.h),
                TextField(
                  controller: customPercentageController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'e.g., 25',
                    suffixText: '%',
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                setState(() {
                  selectedPercentageIndex = null;
                });
              },
            ),
            TextButton(
              child: Text('OK'),
              onPressed: () {
                if (customPercentageController.text.isNotEmpty) {
                  Navigator.of(context).pop();
                } else {
                  // Show error if empty
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Please enter a percentage value')),
                  );
                }
              },
            ),
          ],
        );
      },
    );
  }

  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '${hour == 0 ? 12 : hour}:$minute $period';
  }

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
                icon: Icon(Icons.add, color: appButtonColor, size: 40.w),
              ),
            ),
      body: !isOpen
          ? Stack(
              children: [
                if (isLoading)
                  SizedBox(
                    height: MediaQuery.of(context).size.height.h,
                    width: MediaQuery.of(context).size.width.w,
                    child: const Center(child: CircularProgressIndicator()),
                  ),
                Padding(
                  padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 30.h),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _offerBanner(),
                        SizedBox(height: 40.h),
                        SizedBox(
                          width: 250.w,
                          child: AppFilterDropDown(
                            hint: selectedOption,
                            icon: Icons.tune,
                            toogleDropdown: () {
                              showModalBottomSheet(
                                backgroundColor: Colors.white,
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(25.r),
                                  ),
                                ),
                                builder: (context) {
                                  return Padding(
                                    padding: EdgeInsets.all(30.w),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Container(
                                          width: 40.w,
                                          height: 5.h,
                                          decoration: BoxDecoration(
                                            color: Colors.grey[300],
                                            borderRadius: BorderRadius.circular(
                                              10.r,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 16.h),
                                        Container(
                                          width: MediaQuery.of(
                                            context,
                                          ).size.width,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              20.r,
                                            ),
                                          ),
                                          padding: EdgeInsets.all(16.w),
                                          child: Column(
                                            children: [
                                              Divider(color: Colors.grey[200]),
                                              SizedBox(height: 10.h),
                                              GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    selectedOption = "Active";
                                                  });
                                                  Navigator.pop(context);
                                                  await getOffers();
                                                },
                                                child: AppText(
                                                  text: "Active",
                                                  size: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Divider(color: Colors.grey[200]),
                                              SizedBox(height: 10.h),
                                              GestureDetector(
                                                onTap: ()async {
                                                  setState(() {
                                                    selectedOption = "InActive";
                                                  });
                                                  Navigator.pop(context);
                                                  await getOffers();
                                                },
                                                child: AppText(
                                                  text: "InActive",
                                                  size: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Divider(color: Colors.grey[200]),
                                              SizedBox(height: 10.h),
                                              GestureDetector(
                                                onTap: () async {
                                                  setState(() {
                                                    selectedOption = "Both Active & InActive";
                                                  });
                                                  Navigator.pop(context);
                                                  await getOffers();
                                                },
                                                child: AppText(
                                                  text: "Both Active & InActive",
                                                  size: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(height: 10.h),
                                              Divider(color: Colors.grey[200]),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                        SizedBox(height: 20.h),
                        if (hasItem)
                          Column(
                            children: [
                              AppText(
                                text: "Total ${offerList.length} offers",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: appTextColor2,
                              ),
                              SizedBox(height: 10.h),
                              offerList.isNotEmpty?  ListView.builder(
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemCount: offerList.length,
                                itemBuilder: (context, index) {
                                  final offer = offerList[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              RestaurantProfile(),
                                        ),
                                      );
                                    },
                                    child: OfferCard(
                                      percentage: offer.discountPercentage,
                                      applicableFor: offer.applicableFor,
                                      dineType: offer.dineType,
                                      startTime: offer.startTime,
                                      endTime: offer.endTime,
                                      activeDays: offer.activeDays,
                                      status: offer.status,
                                      uuid: offer.uuid,
                                      url: 'assets/images/discountbanner2.png',
                                      deleteOnTap: () {
                                        setState(() {
                                          isDeletePressed = !isDeletePressed;
                                        });
                                      },
                                      editOnTap: () {},
                                    ),
                                  );
                                },
                              ) : isLoading ? SizedBox.shrink() :  AppText(text: "No Offers in $selectedOption section", size: 15, fontWeight: FontWeight.w600,color: appTextColor2,)
                            ],
                          )
                        else
                          Expanded(
                            child: Center(child: Text("No promotions  added")),
                          ),
                      ],
                    ),
                  ),
                ),
                if (isDeletePressed) _deleteWidget(),
              ],
            )
          : SingleChildScrollView(child: _discountCreatePage()),
    );
  }

  Widget _offerBanner() {
    return Row(
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
                Icon(Icons.location_on, size: 15.w, color: appTextColor3),
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
          child: Icon(Icons.menu, size: 30.w, color: appTextColor3),
        ),
      ],
    );
  }

  Widget _deleteWidget() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height.h,
          width: MediaQuery.of(context).size.width.w,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
        ),
        Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              height: 150.h,
              width: double.infinity,
              padding: EdgeInsets.only(left: 40.w, right: 40.w, top: 30.h),
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
                children: [
                  AppText(
                    text: "Are you sure you want to delete this offer?",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    isCentered: true,
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: AppButton(
                            text: "Yes",
                            onPressed: () {
                              setState(() {
                                isDeletePressed = !isDeletePressed;
                              });
                            },
                            size: 15.sp,
                            borderRadius: 5.r,
                            bgColor1: Colors.green,
                            bgColor2: Colors.green,
                          ),
                        ),
                      ),
                      SizedBox(width: 20.w),
                      Expanded(
                        child: SizedBox(
                          height: 35.h,
                          child: AppButton(
                            text: "No",
                            onPressed: () {},
                            size: 15.sp,
                            borderRadius: 5.r,
                            bgColor1: Colors.red,
                            bgColor2: Colors.red,
                          ),
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
    );
  }

  Widget _discountCreatePage() {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 40.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () async {
                setState(() {
                  isOpen = !isOpen;
                  isLoading = true;
                  offerList = [];
                  selectedOption = "Both Active & InActive";
                });
                OfferListResponse response = await offerService.getAllOffers();
                setState(() {
                  offerList = response.offers;
                  isLoading = false;
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 30.w,
                  color: appTextColor3,
                ),
              ),
            ),
            AppText(
              text: "Add Promotions!",
              size: 25,
              fontWeight: FontWeight.w600,
              color: appTextColor3,
              isCentered: true,
            ),
            SizedBox(height: 20.h),
            SizedBox(
              width: double.infinity.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Discount Percentage",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor3,
                  ),
                  SizedBox(height: 10.h),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      percentageList.length,
                      (index) => _discountBox(
                        percentageList[index] == "Custom" &&
                                selectedPercentageIndex == index &&
                                customPercentageController.text.isNotEmpty
                            ? "${customPercentageController.text}%"
                            : percentageList[index],
                        selectedPercentageIndex == index,
                        () async {
                          if (percentageList[index] == "Custom") {
                            setState(() {
                              selectedPercentageIndex = index;
                            });
                            await _showCustomPercentageDialog();
                          } else {
                            setState(() {
                              selectedPercentageIndex = index;
                            });
                          }
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AppText(
                    text: "Which items does this offer apply to?",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor3,
                  ),
                  SizedBox(height: 20.h),
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
                  SizedBox(height: 20.h),
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
                              (states) => isDineInChecked
                                  ? appToggleColor
                                  : Colors.transparent,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                            side: BorderSide(color: appToggleColor, width: 2.w),
                            checkColor: Colors.white,
                            activeColor: appToggleColor,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                          ),
                        ],
                      ),
                      SizedBox(width: 30.w),
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
                              (states) => isTakeAwayChecked
                                  ? appToggleColor
                                  : Colors.transparent,
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
                  SizedBox(height: 20.h),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          blurRadius: 10.r,
                          offset: Offset(0, 4.r),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: 30.w,
                        right: 30.w,
                        top: 20.h,
                        bottom: 20.h,
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
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () => _selectTime(context, true),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 20.w,
                                            color: Colors.grey[600],
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            _formatTime(startTime),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
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
                                  SizedBox(height: 10.h),
                                  GestureDetector(
                                    onTap: () => _selectTime(context, false),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 12.w,
                                        vertical: 8.h,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.circular(
                                          8.r,
                                        ),
                                      ),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.access_time,
                                            size: 20.w,
                                            color: Colors.grey[600],
                                          ),
                                          SizedBox(width: 8.w),
                                          Text(
                                            _formatTime(endTime),
                                            style: TextStyle(
                                              fontSize: 16.sp,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
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
                              SizedBox(height: 10.h),
                              Wrap(
                                spacing: 10,
                                runSpacing: 10,
                                children: List.generate(
                                  weekList.length,
                                  (index) => _discountBox(
                                    weekList[index],
                                    selectedWeekIndices.contains(index),
                                    () {
                                      setState(() {
                                        if (selectedWeekIndices.contains(
                                          index,
                                        )) {
                                          selectedWeekIndices.remove(index);
                                        } else {
                                          selectedWeekIndices.add(index);
                                        }
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20.h),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  AppButton(
                    text: 'Create',
                    onPressed: () {
                      createOffer();
                      // setState(() {
                      //   isOpen = !isOpen;
                      // });
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
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected ? appTextColor3 : Colors.transparent,
          border: Border.all(color: appTextColor3, width: 1),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: TextStyle(color: isSelected ? Colors.white : appTextColor3),
        ),
      ),
    );
  }
}
