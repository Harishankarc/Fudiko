import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class TakeAway extends StatefulWidget {
  final VoidCallback? onDrawerTap;
  const TakeAway({super.key,this.onDrawerTap});

  @override
  State<TakeAway> createState() => _TakeAwayState();
}

class _TakeAwayState extends State<TakeAway> {
  String selectedStatus = "All Orders";
  bool hasData = false;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Stack(
                children: [
                  Positioned(
                    right: 0,
                    top: 0,
                    child: Container(
                      height: double.infinity,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: appSecondaryBackgroundColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: const Center(child: Text("Helloo")),
                    ),
                  ),
                  Column(
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
                            GestureDetector(
                              onTap: widget.onDrawerTap,
                              child: Icon(
                                Icons.menu,
                                size: 30,
                                color: appTextColor3,
                              ),
                            ),
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
                ],
              ),
            ),
          ),

          if (!hasData) const Center(child: Text("No orders yet")),


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
