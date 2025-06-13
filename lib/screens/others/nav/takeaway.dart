import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class TakeAway extends StatefulWidget {
  const TakeAway({super.key});

  @override
  State<TakeAway> createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {
  String selectedStatus = "All Orders";
  bool hasData = false;

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
              physics: BouncingScrollPhysics(
                decelerationRate: ScrollDecelerationRate.normal,
              ),
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
                    child: Column(
                      children: [
                        Row(
                          children: [
                            buildStatusButton("All Orders"),
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
                  if (hasData)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        children: [
                          // Your orders here
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),

          if (!hasData)
            Center(
              child: Text("No orders yet"),
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
