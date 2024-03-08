import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/BottomBar/business_bar.dart';
import 'package:pbl/View/HomeScreen/BottomBar/home_bar.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({super.key});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text("Payment", style: FonTextStyle.black20TextStyle()),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      Get.to(const BusinessBar());
                    },
                    child: Container(
                      height: 30,
                      width: 45,
                      decoration: BoxDecoration(
                          color: ColorHelper.kBlack12,
                          borderRadius: BorderRadius.all(Radius.circular(4.r)),
                          border: Border.all(color: ColorHelper.kBlack)),
                      child: Center(
                          child: Text("skp",
                              style: FonTextStyle.black15400TextStyle())),
                    ),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(height: 20.h),
              commonButton("Pay", ColorHelper.kBlack12, () {
                Get.to(const HomeBar());
              }),
              SizedBox(height: 10.h),
              commonButton("Submit", ColorHelper.kBlack12, () {
                Get.to(const HomeBar());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
