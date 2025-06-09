import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/descriptionBox.dart';
import 'package:fudiko/utils/constants.dart';

class InfoPage2 extends StatelessWidget {
  const InfoPage2 ({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              DescriptionTextArea(
                hintText: "Describe your shop in a short and clear way so customers quickly know your food and theme.",
                maxLength: 450,
                icon: Icons.list,
                onChanged: (value) {},
              ),
              SizedBox(height: 20),
              AppTextFeild(text: "Available dishes", icon: Icons.fastfood,iconColor: appTextColor,),
              SizedBox(height: 20),
              AppTextFeild(text: "Address", icon: Icons.home,iconColor: appTextColor,),
              SizedBox(height: 20),
              AppTextFeild(text: "Contact number", icon: Icons.phone,iconColor: appTextColor,),

              SizedBox(height: 150),
              AppButton(text: 'Continue', onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
