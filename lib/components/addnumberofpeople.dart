
import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class NumberOfPeopleModal extends StatefulWidget {
  final VoidCallback? bookingOnClick;
  const NumberOfPeopleModal({super.key, this.bookingOnClick});

  @override
  State<NumberOfPeopleModal> createState() => _NumberOfPeopleModalState();
}

class _NumberOfPeopleModalState extends State<NumberOfPeopleModal> {
  int? selectedDiscountIndex = 0;
  int? selectedTypeIndex = 0;
  bool isBookingClicked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3.5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding: const EdgeInsets.all(16),
              child: !isBookingClicked ? _addNoOfPeople() : _confirmBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: appTextColor, size: 25))],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/checked.png',
                height: 60,
                width: 60,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              AppText(text: "Booking Successful!", size: 30, fontWeight: FontWeight.w500,color: appTextColor3,),
              SizedBox(height: 20),
              AppText(text: "You have received a coupon for a 40% discount on the entire menu for today at 2:00 PM", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,isCentered: true,lineSpacing: 1.5,),

            ],
          ),
        ),
      ],
    );
  }

  Widget _addNoOfPeople() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: appTextColor, size: 25))],
        ),
        SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "Number of People",
                size: 15,
                fontWeight: FontWeight.w500,
                color: appTextColor2,
                isCentered: true,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "-",
                        size: 50,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "5",
                        size: 50,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "+",
                        size: 50,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 200,
                child: AppButton(
                  text: "Book",
                  onPressed: () {
                    setState(() {
                      isBookingClicked = !isBookingClicked;
                    });
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
