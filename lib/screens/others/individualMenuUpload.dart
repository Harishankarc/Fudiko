import 'package:flutter/material.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/appfilterdropdown.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/components/menucard.dart';
import 'package:fudiko/screens/others/establishmentSelect.dart';
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
          margin: const EdgeInsets.only(bottom: 40, right: 20),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => IndividualMenuUpload2(),
                  ),
                );
              });
            },
            icon: Icon(Icons.add, color: appButtonColor, size: 40),
          ),
        ),
        body: Column(
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
                ),
              ],
            ),
            SizedBox(height: 35),
            SizedBox(
              width: 250,
              child: AppFilterDropDown(
                items: ['Active', 'Inactive', 'Both Active & Inactive'],
                hint: 'Both Active and Inactive',
                icon: Icons.tune,
              ),
            ),
      
            if(!hasData)
              Expanded(child: Center(child: Text("No Items added")))
            else
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    padding: const EdgeInsets.only(top: 30),
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return MenuCard(url: 'assets/images/dish.png');
                    },
                  ),
                ),
              )
      
      
          ],
        ),
      ),
    );
  }
}
