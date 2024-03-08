import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/payment.dart';
import 'package:pbl/Model/Widgets/common_textfomfield.dart';

class KycScreen extends StatefulWidget {
  const KycScreen({super.key});

  @override
  State<KycScreen> createState() => _KycScreenState();
}

class _KycScreenState extends State<KycScreen> {
  final aadhaar = TextEditingController();
  final pan = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.h),
                child: Column(
                  children: [
                    SizedBox(height: 10.h),
                    Text("KYC", style: FonTextStyle.black20TextStyle()),
                    const Divider(),
                    SizedBox(height: 10.h),
                    Container(
                      height: 170.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorHelper.kBlack12,
                          //  image: DecorationImage(image: AssetImage("")),
                          borderRadius: BorderRadius.all(Radius.circular(6.r))),
                      child: Center(
                          child: Text("Add To Business Cat",
                              style: FonTextStyle.black20TextStyle())),
                    ),
                    SizedBox(height: 15.h),
                    Container(
                      height: 170.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: ColorHelper.kBlack12,
                          //  image: DecorationImage(image: AssetImage("")),
                          borderRadius: BorderRadius.all(Radius.circular(6.r))),
                      child: Center(
                          child: Text("Add To Aadhaar Cat",
                              style: FonTextStyle.black20TextStyle())),
                    ),
                    SizedBox(height: 15.h),
                    CommonTextFomField(
                        controller: aadhaar,
                        keyboardType: TextInputType.number,
                        labelText: "Enter Aadhaar Number "),
                    SizedBox(height: 15.h),
                    CommonTextFomField(
                        controller: pan,
                        keyboardType: TextInputType.number,
                        labelText: "Enter PAN Number "),
                    SizedBox(height: 20.h),
                    commonButton("Submit", ColorHelper.kBlack12, () {
                      Get.to(const PaymentScreen());
                    }),
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
