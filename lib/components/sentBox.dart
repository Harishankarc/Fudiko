import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class SentBox extends StatelessWidget {

  final String? moneyDetails;
  final String? discountDetails;
  final String? messageDetails;

  const SentBox({
    super.key,
    this.discountDetails,
    this.messageDetails,
    this.moneyDetails
  });

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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppText(
                          text: "P17866",
                          size: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 10),
                        moneyDetails != null ?  Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.wallet, color: appTextColor5, size: 18),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                moneyDetails ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor5,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ) : SizedBox.shrink(),
                        const SizedBox(height: 10),
                        discountDetails != null ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.local_offer_sharp,
                              color: appTextColor5,
                              size: 18,
                            ),
                            const SizedBox(width: 5),
                            Flexible(
                              child: Text(
                                discountDetails ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor5,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ) : SizedBox.shrink(),
                        const SizedBox(height: 10),
                        messageDetails != null ? Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.message, color: appTextColor5, size: 18),
                            const SizedBox(width: 5),
                            Expanded(
                              child: Text(
                                messageDetails ?? "",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                  color: appTextColor5,
                                ),
                                softWrap: true,
                              ),
                            ),
                          ],
                        ) : SizedBox.shrink(),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    flex: 1,
                    child: Column(
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
                  ),
                ],
              ),
              const SizedBox(height: 25),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 35,
                    width: 100,
                    child: AppButton(
                      text: "Delete",
                      onPressed: () {},
                      bgColor1: Colors.red,
                      bgColor2: Colors.red,
                      size: 12,
                      borderRadius: 5,
                    ),
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
