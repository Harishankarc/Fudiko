import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/descriptionBox.dart';
import 'package:fudiko/utils/constants.dart';

class IndividualMenuUpload2 extends StatefulWidget {
  const IndividualMenuUpload2({super.key});

  @override
  State<IndividualMenuUpload2> createState() => _IndividualMenuUpload2State();
}

class _IndividualMenuUpload2State extends State<IndividualMenuUpload2> {
  int? selectedIndex;
  List<String> foodList = [
    "Starter",
    "Main Course",
    "Salad",
    "Drink",
    "Slides",
    "Grill & BBQ",
    "Desserts",
    "Continental",
    "Soups",
  ];

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
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                width: double.infinity,
                height: 120,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: menuUploadBoxColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.file_upload_outlined,
                      color: Colors.black,
                      size: 30,
                    ),
                    SizedBox(height: 10),
                    AppText(
                      text: "Click here to choose",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: appTextColor2,
                    ),
                    AppText(
                      text: "your image",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: appTextColor2,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [
                  AppTextFeild(
                    text: "Item Name",
                    icon: Icons.fastfood,
                    iconColor: Colors.black,
                  ),
                  SizedBox(height: 20),
                  DescriptionTextArea(
                    hintText: "Short Description",
                    icon: Icons.book,
                    iconColor: Colors.black,
                    maxLines: 3,
                    maxLength: 350,
                  ),
                  SizedBox(height: 20),
                  AppTextFeild(
                    text: "Price",
                    icon: Icons.money,
                    iconColor: Colors.black,
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Select Your Item Category",
                          size: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      foodList.length,
                      (index) => _discountBox(
                        foodList[index],
                        selectedIndex == index,
                        () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: 150,
                    height: 50,
                    child: AppButton(text: "Add", onPressed: () {},size: 15,),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _discountBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? appTextColor3 : Colors.grey.shade400,
          border: Border.all(
            color: !isSelected ? Colors.grey.shade400 : appTextColor3,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
