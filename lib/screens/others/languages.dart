import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/utils/constants.dart';

class Languages extends StatefulWidget {
  const Languages({super.key});

  @override
  State<Languages> createState() => _LanguagesState();
}

class _LanguagesState extends State<Languages> {
  String selectedLanguage = "English";

  Widget _buildLanguageTile(String language) {
    final bool isSelected = selectedLanguage == language;

    return GestureDetector(
      onTap: () {
        setState(() {
          selectedLanguage = language;
        });
      },
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? appLangBg : Colors.transparent,
        ),
        padding:  EdgeInsets.symmetric(vertical: 20.h),
        child: Center(
          child: AppText(
            text: language,
            size: 15,
            fontWeight: FontWeight.w500,
            color: appTextColor3,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Padding(
              padding:  EdgeInsets.only(top: 40.h, left: 30.w),
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
          ),

           SizedBox(height: 60.h),

          const Divider(thickness: 1, color: Colors.grey,height: 1,),
          _buildLanguageTile("English"),

          const Divider(thickness: 1, color: Colors.grey,height: 1,),
          _buildLanguageTile("Arabic"),

          const Divider(thickness: 1, color: Colors.grey,height: 1,),
        ],
      ),
    );
  }
}
