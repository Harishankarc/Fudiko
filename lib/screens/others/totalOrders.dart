import 'package:flutter/material.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/donutPercentage.dart';
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
              Padding(
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
              ConstrainedBox(
                constraints: BoxConstraints(maxWidth: 200),
                child: AppFilterDropDown(
                  items: ["Item1", "Item2", "Item3", "Item4"],
                  hint: "This Month",
                  icon: Icons.tune,
                ),
              ),
              SizedBox(height: 45,),
              AppText(text: "TOTAL ORDERS", size: 20, fontWeight: FontWeight.w600,isCentered: true,),
              SizedBox(height: 10,),
              AppText(text: "387", size: 40, fontWeight: FontWeight.w600,isCentered: true,color: appTextColor3,),
              SizedBox(height: 40,),
              SizedBox(
                width: 200,
                height: 200,
                child: OrderDonut(done: 291 , total: 387,),
              ),
              SizedBox(height: 10,),
              AppText(text: "Completed", size: 20, fontWeight: FontWeight.w400,isCentered: true,color: appTextColor2,),
              SizedBox(height: 40,),
              SizedBox(
                width: 200,
                height: 200,
                child: OrderDonut(done: 87, total: 387,mainColor: Colors.green,secondaryColor: Colors.greenAccent,),
              ),
              SizedBox(height: 10,),
              AppText(text: "Cancelled", size: 20, fontWeight: FontWeight.w400,isCentered: true,color: appTextColor2,),
            ],
          ),
        ),
      ),
    );
  }
}
