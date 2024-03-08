import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/form.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),
              Center(
                  child: Text(" TBL Intro ",
                      style: FonTextStyle.black20TextStyle())),
              const Divider(),
              SizedBox(height: 20.h),
              Center(
                child: Text("Welcome to Business Club",
                    style: FonTextStyle.black20TextStyle()),
              ),
              Center(
                child: SizedBox(
                  width: 220.w,
                  height: 220.h,
                  child:
                      Image.asset("assets/images/logo.png", fit: BoxFit.cover),
                ),
              ),
              SizedBox(height: 20.h),
              Text('Thanks for joining/ordering. We’re thrilled to have you.',
                  style: FonTextStyle.black15400TextStyle()),
              SizedBox(height: 20.h),
              Text(
                  "Welcome to PBL Get ready for some amazing deals and updates right here. 😊",
                  style: FonTextStyle.black15400TextStyle()),
              SizedBox(height: 30.h),
              Text("Thanks again.", style: FonTextStyle.black15400TextStyle()),
              SizedBox(height: 35.h),
              commonButton("Join", ColorHelper.kBlack12, () {
                Get.to(const FormScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
