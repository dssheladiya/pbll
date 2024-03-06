import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/payment.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Conditions & KYC", style: FonTextStyle.black20TextStyle()),
              const Divider(),
              SizedBox(height: 15.h),
              Row(
                children: [
                  Container(
                    width: 158.w,
                    height: 150.h,
                    color: Colors.deepPurple,
                    // child: Image.asset(""),
                  ),
                  const Spacer(),
                  Container(
                    width: 158.w,
                    height: 150.h,
                    color: Colors.deepPurple,
                    // child: Image.asset(""),
                  ),
                ],
              ),
              
              SizedBox(height: 10.h),
              Row(
                children: [
                  Container(
                    width: 158.w,
                    height: 150.h,
                    color: Colors.deepPurple,
                    // child: Image.asset(""),
                  ),
                  const Spacer(),
                  Container(
                    width: 158.w,
                    height: 150.h,
                    color: Colors.deepPurple,
                    // child: Image.asset(""),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              commonButton("Submit", ColorHelper.kBlack12, () {
                Get.to(const PaymentScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
