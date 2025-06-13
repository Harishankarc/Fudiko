import 'package:flutter/material.dart';
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
  const Reservation({super.key});

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
      floatingActionButton: Container(
        margin: const EdgeInsets.all(16),
        height: 60,
        width: 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
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
            height: 60,
            width: 60,
            fit: BoxFit.contain,
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                                  size: 15,
                                  color: appTextColor3,
                                ),
                                const SizedBox(width: 5),
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
                  ),
                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: !isSearchClicked
                        ? Column(
                            children: [
                              Row(
                                children: [
                                  buildStatusButton("Processing"),
                                  const SizedBox(width: 10),
                                  buildStatusButton("Confirmed"),
                                ],
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  buildStatusButton("Completed"),
                                  const SizedBox(width: 10),
                                  buildStatusButton("Rejected"),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSearchClicked = !isSearchClicked;
                                        selectedStatus = "Search";
                                      });
                                    },
                                    child: Container(
                                      height: 35,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
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
                                        size: 20,
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
                  const SizedBox(height: 30),
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: AppFilterDropDown(
                                  items: ["Item1", "Item2", "Item3", "Item4"],
                                  hint: "Last 7 days",
                                  icon: Icons.tune,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          buildList(3, const CompletedBox()),
                        ],
                      ),
                    )
                  else if(selectedStatus == "Rejected")
                    buildList(1, const RejectedBox())
                  else
                    SizedBox.shrink()
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
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
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
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(
                        top: 20,
                        bottom: 20,
                        left: 10,
                        right: 10,
                      ),
                      child: Column(
                        children: [
                          AppText(
                            text: "Reason",
                            size: 15,
                            fontWeight: FontWeight.w700,
                            color: appButtonColor2,
                            isCentered: true,
                          ),
                          SizedBox(height: 20),
                          Row(
                            children: [
                              buildReasonButton(
                                " Date or Time is not available",
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildReasonButton("Offer Expired"),
                              const SizedBox(width: 10),
                              buildReasonButton("Not Valid"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildReasonButton("Maximum Redemptions Reached"),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              buildReasonButton("Technical Issue"),
                              const SizedBox(width: 10),
                              buildReasonButton("Not Opened"),
                            ],
                          ),
                          SizedBox(height: 15),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: AppButton(
                                text: "Cancel",
                                onPressed: () {},
                                bgColor1: Colors.blue,
                                bgColor2: Colors.blue,
                                size: 15,
                                borderRadius: 5,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: AppButton(
                                text: "Confirm Rejection",
                                onPressed: () {
                                  setState(() {
                                    isOpen = !isOpen;
                                  });
                                },
                                bgColor1: Colors.red,
                                bgColor2: Colors.red,
                                size: 15,
                                borderRadius: 5,
                              ),
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
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(10),
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
              fontSize: 13,
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
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : const LinearGradient(colors: [Colors.grey, Colors.grey]),
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
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
