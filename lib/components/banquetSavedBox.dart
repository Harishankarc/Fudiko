import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class BanquetSavedBox extends StatelessWidget {
  const BanquetSavedBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        width: double.infinity,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "P17854",
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: appTextColor3,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.wallet_rounded,
                              color: appTextColor5,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '1000',
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.calendar_month_rounded,
                              color: appTextColor5,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: RichText(
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.groups, color: appTextColor5, size: 18),
                            const SizedBox(width: 5),
                            Flexible(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '12',
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
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.fastfood,
                              color: appTextColor5,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                'Chicken Biriyani, Porotta, Rotti, Salad, Payasam, Butter Chicken, Ice cream.',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor5,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      AppText(
                        text: "Apr 11",
                        size: 10,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                      const SizedBox(height: 5),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.delete, color: Colors.red, size: 20),
                      const SizedBox(width: 5),
                      Icon(
                        Icons.person_search_sharp,
                        color: appLinkColor,
                        size: 20,
                      ),
                      AppText(
                        text: "Details",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: appLinkColor,
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.timer, color: Colors.red, size: 20),
                          const SizedBox(width: 5),
                          AppText(
                            text: "02:53:49",
                            size: 10,
                            fontWeight: FontWeight.w400,
                            color: Colors.red,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      SizedBox(
                        width: 150,
                        height: 35,
                        child: AppButton(
                          text: "Offer Discount",
                          onPressed: () {},
                          bgColor1: appToggleColor,
                          bgColor2: appToggleColor,
                          size: 12,
                          borderRadius: 5,
                        ),
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
