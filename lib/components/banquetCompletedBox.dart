import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class BanquetCompletedBox extends StatelessWidget {
  const BanquetCompletedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: "P17867",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: appTextColor5,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.wallet,
                            color: appTextColor5,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '1200',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: appTextColor5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Per Person',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: appTextColor5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer,
                            color: appTextColor5,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '5%',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: appTextColor5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' on extra drinks',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: appTextColor5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.groups, color: appTextColor5, size: 18),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '20',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: appTextColor5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' Person',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                    color: appTextColor5,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: "Apr 09",
                        size: 10,
                        fontWeight: FontWeight.w600,
                        color: appTextColor5,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        text: "08:30am",
                        size: 10,
                        fontWeight: FontWeight.w600,
                        color: appTextColor5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
