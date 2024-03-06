import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';

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
              Text("Payment", style: FonTextStyle.black20TextStyle()),
              const Divider(),
              SizedBox(height: 20.h),
              commonButton("Submit", ColorHelper.kBlack12, () {
                //  Get.to(const PaymentScreen());
              }),
            ],
          ),
        ),
      ),
    );
  }
}
