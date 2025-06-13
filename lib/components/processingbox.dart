import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class ProcessingBox extends StatelessWidget {
  final VoidCallback? deleteOnPressed;
  const ProcessingBox({super.key,this.deleteOnPressed});

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
                        text: "17854",
                        size: 20,
                        fontWeight: FontWeight.bold,
                        color: appTextColor3,
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.local_offer_sharp,
                            color: appTextColor5,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: '25%',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w900,
                                    color: appTextColor5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' offer for entire menu',
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
                            Icons.calendar_month_rounded,
                            color: appTextColor5,
                            size: 18,
                          ),
                          SizedBox(width: 5),
                          RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: 'April 12',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                    color: appTextColor5,
                                  ),
                                ),
                                TextSpan(
                                  text: ' - 2:30 pm',
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
                                  text: '2',
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
                        text: "Apr 11",
                        size: 10,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                      SizedBox(height: 5),
                      AppText(
                        text: "12:30pm",
                        size: 10,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 15),
              SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.person_search_sharp,
                          color: appLinkColor,
                          size: 18,
                        ),
                        const SizedBox(width: 5),
                        AppText(
                          text: "Details",
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: appLinkColor,
                        ),
                      ],
                    ),

                    SizedBox(
                      width: 180,
                      child: Row(
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: AppButton(
                                text: "Decline",
                                onPressed: deleteOnPressed ?? (){},
                                bgColor1: Colors.red,
                                bgColor2: Colors.red,
                                size: 12,
                                borderRadius: 5,
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: SizedBox(
                              height: 35,
                              child: AppButton(
                                text: "Accept",
                                onPressed: () {},
                                bgColor1: Colors.green,
                                bgColor2: Colors.green,
                                size: 12,
                                borderRadius: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
