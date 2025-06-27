import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/menucard.dart';
import 'package:fudiko/screens/others/individualMenuUpload2.dart';
import 'package:fudiko/utils/constants.dart';

class IndividualMenuUpload extends StatefulWidget {
  const IndividualMenuUpload({super.key});

  @override
  State<IndividualMenuUpload> createState() => _IndividualMenuUploadState();
}

class _IndividualMenuUploadState extends State<IndividualMenuUpload> {
  bool isOpen = false;
  bool hasData = true;
  List<String> menuPdfList = ['Chinese Menu', 'Indian Menu'];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: Container(
          margin: EdgeInsets.only(bottom: 40.h, right: 20.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10.r,
                offset: Offset(0, 4.r),
              ),
            ],
          ),
          child: IconButton(
            onPressed: () {
              setState(() {
                isOpen = !isOpen;
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IndividualMenuUpload2(),
                  ),
                );
              });
            },
            icon: Icon(Icons.add, color: appButtonColor, size: 40.w),
          ),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Image.asset(
                  'assets/images/banner1.png',
                  height: 150.h,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.all(30.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 30.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 35.h),
            SizedBox(
              width: 220.w,
              child: AppFilterDropDown(
                items: ['Active', 'Inactive', 'Both Active & Inactive'],
                hint: 'Both Active and Inactive',
                icon: Icons.tune,
              ),
            ),

            if (!hasData)
              Expanded(child: Center(child: Text("No Items added")))
            else
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 30.h, bottom: 30.h),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: MenuCard(url: 'assets/images/dish.png'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }
}
