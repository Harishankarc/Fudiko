import 'package:flutter/material.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/orderDonut.dart';
import 'package:fudiko/utils/constants.dart';

class TotalOrders extends StatelessWidget {
  const TotalOrders({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 30,
                        color: appTextColor3,
                      ),
                    ],
                  ),
                ),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: AppFilterDropDown(
                  hint: "This Month",
                  icon: Icons.tune,
                  toogleDropdown: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: const EdgeInsets.all(30),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              const SizedBox(height: 16),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Divider(color: Colors.grey[200]),
                                    const SizedBox(height: 10),
                                    AppText(
                                      text: "item1",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(color: Colors.grey[200]),
                                    const SizedBox(height: 10),
                                    AppText(
                                      text: "item2",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 10),
                                    Divider(color: Colors.grey[200]),
                                    const SizedBox(height: 10),
                                    AppText(
                                      text: "item3",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    const SizedBox(height: 10),
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
              SizedBox(height: 45),
              AppText(
                text: "TOTAL ORDERS",
                size: 20,
                fontWeight: FontWeight.w600,
                isCentered: true,
              ),
              SizedBox(height: 10),
              AppText(
                text: "387",
                size: 40,
                fontWeight: FontWeight.w600,
                isCentered: true,
                color: appTextColor3,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 200,
                child: OrderDonut(done: 291, total: 387),
              ),
              SizedBox(height: 10),
              AppText(
                text: "Completed",
                size: 20,
                fontWeight: FontWeight.w400,
                isCentered: true,
                color: appTextColor2,
              ),
              SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 200,
                child: OrderDonut(
                  done: 87,
                  total: 387,
                  mainColor: Colors.green,
                  secondaryColor: Colors.greenAccent,
                ),
              ),
              SizedBox(height: 10),
              AppText(
                text: "Cancelled",
                size: 20,
                fontWeight: FontWeight.w400,
                isCentered: true,
                color: appTextColor2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
