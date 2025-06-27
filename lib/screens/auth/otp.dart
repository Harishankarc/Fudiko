import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudiko/components/appbutton.dart';
import 'package:fudiko/components/apptext.dart';
import 'package:fudiko/components/apptextfeild.dart';
import 'package:fudiko/models/otp/otp-model.dart';
import 'package:fudiko/models/otp/otp-response-model.dart';
import 'package:fudiko/models/otp/otp-verified-response-model.dart';
import 'package:fudiko/screens/others/infoPage.dart';
import 'package:fudiko/services/otp-service.dart';
import 'package:fudiko/utils/constants.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {


  OtpService otpService = OtpService();
  String? otpId;
  List<TextEditingController> controllers = List.generate(
    4,
    (_) => TextEditingController(),
  );
  List<FocusNode> focusNodes = List.generate(4, (_) => FocusNode());

  Future<void> sendOtpToEmail() async{
    OtpResponseModel response = await otpService.sendOtp();
    if(response.status){
      if (!mounted) return;
      setState(() {
        otpId = response.otp;
      });
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
    }else{
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
    }
  }

  Future<void> verifyOtp() async{
    String enteredOtp = controllers.map((c) => c.text).join();
    OtpVerifyModel otpVerifyModel = OtpVerifyModel(otp: enteredOtp, otpId: otpId!);
    OtpVerifiedResponseModel response = await otpService.verifyOtp(otpVerifyModel,);
    if(response.status){
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => InfoPage()),
      );
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
    }
  }

  @override
  void initState() {
    sendOtpToEmail();
    super.initState();
  }
  @override
  void dispose() {
     for (var controller in controllers) {
      controller.dispose();
    }
    for (var node in focusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/otp.png',
              width: 180.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 40.h,),
            AppText(text: "An OTP has been sent to your registered email address. Kindly enter it to continue.", size: 15, fontWeight: FontWeight.w400,color: appTextColor2,isCentered: true,),
            SizedBox(height: 40.h,),
            buildOtpFields(),
            SizedBox(height: 40.h,),
            AppButton(text: 'Verify', onPressed: () {
              verifyOtp();
            }),
          ],
        ),
      ),
    );
  }
  Widget buildOtpFields() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 60.w,
          child: TextField(
            controller: controllers[index],
            focusNode: focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(counterText: ''),
            onChanged: (value) {
              if (value.length == 1 && index < 3) {
                FocusScope.of(context).requestFocus(focusNodes[index + 1]);
              } else if (value.isEmpty && index > 0) {
                FocusScope.of(context).requestFocus(focusNodes[index - 1]);
              }
            },
          ),
        );
      }),
    );
  }
}