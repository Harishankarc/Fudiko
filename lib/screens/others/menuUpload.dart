import 'package:flutter/material.dart';
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
        margin: const EdgeInsets.only(bottom: 40,right: 20),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: IconButton(
          onPressed: () {
            setState(() {
              isOpen = !isOpen;
            });
          },
          icon: Icon(Icons.add, color: appButtonColor, size: 40),
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
              SizedBox(height: 50,),
              ListView.builder(
                shrinkWrap: true,
                itemCount: menuPdfList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
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
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      height: 400,
                      width: double.infinity,
                      padding: const EdgeInsets.only(
                        left: 40,
                        right: 40,
                        top: 30,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: double.infinity,
                            height: 150,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: menuUploadBoxColor,
                              borderRadius: BorderRadius.circular(15),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.1),
                                  blurRadius: 10,
                                  offset: const Offset(0, 4),
                                ),
                              ],

                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(Icons.file_upload_outlined,color: Colors.black,size: 30,),
                                SizedBox(height: 10,),
                                AppText(text: "Upload Menu as PDF", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,),
                                AppText(text: "Document", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,),
                              ],
                            ),
                          ),
                          SizedBox(height: 20,),
                          AppTextFeild(text: "Menu Name",size: 15,),
                          SizedBox(height: 20,),
                          AppButton(text: 'Upload',
                          size: 15,
                          onPressed: () {
                            setState(() {
                              isOpen = !isOpen;
                            });
                          },bgColor1: Colors.green,bgColor2: Colors.green,),
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
      height: 70,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
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
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
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