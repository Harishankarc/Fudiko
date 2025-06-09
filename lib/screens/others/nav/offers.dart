import 'package:flutter/material.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/offercard.dart';
import 'package:fudiko/utils/constants.dart';

class Offers extends StatefulWidget {
  const Offers({super.key});

  @override
  State<Offers> createState() => _OffersState();
}

class _OffersState extends State<Offers> {
  final bool hasItem = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      floatingActionButton: Container(
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
          onPressed: () {},
          icon: Icon(Icons.add, color: appButtonColor, size: 40),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 60),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
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
                          Icon(Icons.location_on, size: 15, color: appTextColor3),
                          SizedBox(width: 5),
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
              SizedBox(height: 40),
              SizedBox(
                width: 250,
                child: AppFilterDropDown(
                  items: ['Active', 'Inactive', 'Both Active & Inactive'],
                  hint: 'Both Active and Inactive',
                  icon: Icons.tune,
                ),
              ),
              SizedBox(height: 20),
              if (hasItem)
                Column(
                  children: [
                    AppText(text: "Total 6", size: 15, fontWeight: FontWeight.w500,color: appTextColor2,),
                    SizedBox(height: 10),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) => OfferCard(url: 'assets/images/discountbanner2.png',),
                    )
                  ],
                )
              else
                Expanded(child: Center(child: Text("No promotions  added"))),
            ],
          ),
        ),
      ),
    );
  }
}
