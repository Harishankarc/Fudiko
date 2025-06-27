import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/utils/constants.dart';

class MenuUpload extends StatefulWidget {
  const MenuUpload({super.key});

  @override
  State<MenuUpload> createState() => _MenuUploadState();
}

class _MenuUploadState extends State<MenuUpload> {

  bool isOpen = false;
  List<String> menuPdfList = ['Chinese Menu','Indian Menu'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        margin:  EdgeInsets.only(bottom: 40.h,right: 20.w),
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
            });
          },
          icon: Icon(Icons.add, color: appButtonColor, size: 40.w),
        ),
      ),
      body: Stack(
        children: [

          Column(
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
                    padding:  EdgeInsets.all(20.w),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back_ios_outlined,
                        size: 30.w,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 50.h,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: menuPdfList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 20.w),
                    child: _pdfBox(menuPdfList[index]),
                  );
                },
              ),

            ],
          ),
          if(isOpen)
            Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.black.withOpacity(0.6),
                ),
                Center(
                  child: Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                      width: double.infinity,
                      padding:  EdgeInsets.only(
                        left: 40.w,
                        right: 40.w,
                        top: 30.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10.r,
                            offset:  Offset(0, 4.r),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: double.infinity,
                            padding:  EdgeInsets.symmetric(horizontal: 20.w,vertical: 20.w),
                            decoration: BoxDecoration(
                              color: menuUploadBoxColor,
                              borderRadius: BorderRadius.circular(15.r),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10.r,
                                  offset:  Offset(0, 4.r),
                                ),
                              ],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.file_upload_outlined,color: Colors.black,size: 30.w,),
                                SizedBox(height: 10.h,),
                                AppText(text: "Upload Menu as PDF", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,),
                                AppText(text: "Document", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,),
                              ],
                            ),
                          ),
                          SizedBox(height: 20.h,),
                          AppTextFeild(text: "Menu Name",size: 15,),
                          SizedBox(height: 20.h,),
                          AppButton(text: 'Upload',
                          size: 15,
                          
                          borderRadius: 10.w,
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },bgColor1: Colors.green,bgColor2: Colors.green,),
                          SizedBox(height: 20.h,),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }

  Widget _pdfBox(String text){
    return Container(
      width: double.infinity,
      height: 70.h,
      padding:  EdgeInsets.all(16.w),
      margin:  EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10.r,
            offset:  Offset(0, 4.r),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/images/pdfLogo.png',
              height: 40.h,
              width: 40.w,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              text,
                style:  TextStyle(fontSize: 12.sp),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
    );
  }
}