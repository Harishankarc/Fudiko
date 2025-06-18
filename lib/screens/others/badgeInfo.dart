import 'package:flutter/material.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class BadgeInfo extends StatelessWidget {
  const BadgeInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 30, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 60),
            AppText(
              text: "Early Bird",
              size: 20,
              fontWeight: FontWeight.w600,
              isCentered: true,
              color: appToggleColor,
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/verificationgreen.png',
                  width: 150,
                  height: 150,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            const SizedBox(height: 30),
            AppText(
              text: "Your next badge is on its way!",
              size: 10,
              fontWeight: FontWeight.w400,
              isCentered: true,
              color: Colors.black,
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: gradientProgressBar(70),
            ),
            const SizedBox(height: 20),
            AppText(
              text: "87/100",
              size: 15,
              fontWeight: FontWeight.w500,
              isCentered: true,
              color: Colors.black,
            ),
            const SizedBox(height: 60),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: List.generate(
                  25,
                  (index) => Image.asset(
                    'assets/images/verificationgrey.png',
                    width: 50,
                    height: 50,
                    fit: BoxFit.contain,
                  )
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget gradientProgressBar(double percentage) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double clampedPercentage = percentage.clamp(0, 100);

        return Stack(
          children: [
            // Background
            Container(
              height: 10,
              width: constraints.maxWidth,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(5),
              ),
            ),
            // Foreground
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                height: 10,
                width: constraints.maxWidth * (clampedPercentage / 100),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.orange, Colors.pink],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }

}
