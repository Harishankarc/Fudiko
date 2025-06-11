import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/descriptionBox.dart';
import 'package:fudiko/utils/constants.dart';

class RestaurantBioEditPage extends StatelessWidget {
  const RestaurantBioEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/banner1.png',
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Icon(
                    Icons.arrow_back_ios_outlined,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
            SizedBox(height: 100),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: SizedBox(
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DescriptionTextArea(
                      hintText:
                          "Describe your shop in a short and clear way so customers quickly know your food and theme.",
                      maxLength: 450,
                      icon: Icons.list,
                      onChanged: (value) {},
                    ),
                    SizedBox(height: 20),
                    AppTextFeild(
                      text: "Available dishes",
                      icon: Icons.fastfood,
                      iconColor: appTextColor,
                    ),
                    SizedBox(height: 20),
                    AppTextFeild(
                      text: "Address",
                      icon: Icons.home,
                      iconColor: appTextColor,
                    ),
                    SizedBox(height: 20),
                    AppTextFeild(
                      text: "Contact number",
                      icon: Icons.phone,
                      iconColor: appTextColor,
                    ),

                    SizedBox(height: 50),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 100),
                      child: AppButton(text: 'Update', onPressed: () {}),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}