import 'package:flutter/material.dart';
import 'package:fudiko/components/allEnquiryBox.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/banquetCompletedBox.dart';
import 'package:fudiko/components/banquetConfirmedBox.dart';
import 'package:fudiko/components/banquetDeleteBox.dart';
import 'package:fudiko/components/banquetSavedBox.dart';
import 'package:fudiko/components/sentBox.dart';
import 'package:fudiko/utils/constants.dart';

class Banquet extends StatefulWidget {
  final VoidCallback? onDrawerTap;
  const Banquet({super.key,this.onDrawerTap});

  @override
  State<Banquet> createState() => _BanquetState();
}

class _BanquetState extends State<Banquet> {
  String selectedStatus = "All Enquiries";
  bool isDeleteClicked = false;
  List<Map<String, dynamic>> sentBoxDemo = [
    {
      "moneyDetails": "950 Per person",
      "discountDetails": "5% on extra drinks",
      "messageDetails":
          "If you have more than 50 people, we can offer you a price of 850 per head.",
    },
    {
      "moneyDetails": "1100 per person",
      "messageDetails": "Can accommodate up to 80 people with buffet options.",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
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
                        GestureDetector(
                          onTap: widget.onDrawerTap,
                          child: Icon(Icons.menu, size: 30, color: appTextColor3)),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildStatusButton("All Enquiries"),
                            const SizedBox(width: 10),
                            buildStatusButton("Sent"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            buildStatusButton("Confirmed"),
                            const SizedBox(width: 10),
                            buildStatusButton("Completed"),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            buildStatusButton("Saved"),
                            const SizedBox(width: 10),
                            buildStatusButton("Deleted"),
                            const SizedBox(width: 10),
                            Container(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  if (selectedStatus == "All Enquiries")
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return AllEnquiryBox(
                              onPressed: () {
                                setState(() {
                                  isDeleteClicked = !isDeleteClicked;
                                });
                              },
                            );
                          },
                        ),
                      ),
                    )
                  else if (selectedStatus == "Sent")
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: sentBoxDemo.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            final sample = sentBoxDemo[index];
                            return SentBox(
                              moneyDetails: sample["moneyDetails"],
                              discountDetails: sample["discountDetails"],
                              messageDetails: sample["messageDetails"],
                            );
                          },
                        ),
                      ),
                    )
                  else if (selectedStatus == "Confirmed")
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BanquetConfirmedBox();
                          },
                        ),
                      ),
                    )
                  else if (selectedStatus == "Completed")
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
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
                          SizedBox(height: 20),
                          SizedBox(
                            child: ListView.builder(
                              itemCount: 3,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return BanquetCompletedBox();
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (selectedStatus == "Saved")
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BanquetSavedBox();
                          },
                        ),
                      ),
                    )
                  else
                    Padding(
                      padding: const EdgeInsets.only(left: 30, right: 30),
                      child: SizedBox(
                        child: ListView.builder(
                          itemCount: 1,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return BanquetDeleteBox();
                          },
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
          if(isDeleteClicked)
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  child: Text("HIi"),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 150,
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
                            offset: const Offset(0, 4),
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
                          SizedBox(height: 20),
                          Row(
                            children: [
                              Expanded(
                                child: SizedBox(
                                  height: 35,
                                  child: AppButton(
                                    text: "Yes",
                                    onPressed: () {
                                      setState(() {
                                        isDeleteClicked = !isDeleteClicked;
                                      });
                                    },
                                    size: 15,
                                    borderRadius: 5,
                                    bgColor1: Colors.green,
                                    bgColor2: Colors.green,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 20),
                              Expanded(
                                child: SizedBox(
                                  height: 35,
                                  child: AppButton(
                                    text: "No",
                                    onPressed: () {},
                                    size: 15,
                                    borderRadius: 5,
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
            ),
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
}
