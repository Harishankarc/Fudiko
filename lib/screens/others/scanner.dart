import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/screens/others/scanner2.dart';
import 'package:fudiko/utils/constants.dart';

class Scanner extends StatelessWidget {
  const Scanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appTextColor2,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.arrow_back_ios_outlined,
                  size: 30,
                  color: Colors.white,
                ),
              ],
            ),
          ),
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Scanner2()),
                      );
                    },
                    child: Image.asset(
                      'assets/images/scanner.png',
                      height: 300,
                      width: 300,
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 50),
                  AppText(
                    text: "Scan the clients discount",
                    size: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  AppText(
                    text: "coupon here",
                    size: 20,
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                  ),
                  SizedBox(height: 70),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.photo_outlined, color: Colors.white, size: 30),
                      SizedBox(width: 40),
                      Icon(
                        Icons.flash_on_outlined,
                        color: Colors.white,
                        size: 30,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
