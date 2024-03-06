import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/View/HomeScreen/form.dart';

class BusinessBar extends StatefulWidget {
  const BusinessBar({super.key});

  @override
  State<BusinessBar> createState() => _BusinessBarState();
}

class _BusinessBarState extends State<BusinessBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            buildGestureDetector("Abaut Join", () {
              Get.to(FormScreen());
            }),
            SizedBox(height: 20.h),
            buildGestureDetector("Club Join", () {
              Get.to(FormScreen());
            }),
            SizedBox(height: 20.h),
            buildGestureDetector("Groups Join", () {
              Get.to(FormScreen());
            }),
            SizedBox(height: 20.h),
            buildGestureDetector("Business Join", () {
              Get.to(FormScreen());
            }),
            SizedBox(height: 20.h),
            buildGestureDetector("Free Join", () {
              Get.to(FormScreen());
            }),
            SizedBox(height: 20.h),
            buildGestureDetector("Business Form", () {
              Get.to(FormScreen());
            }),
          ],
        ),
      ),
    );
  }

  GestureDetector iconGestureDetector(
      String title, Function()? onTap, IconData? icon) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 105.w,
        decoration: BoxDecoration(
            color: ColorHelper.kBlueGrey,
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: ColorHelper.kWhite70),
            SizedBox(width: 7.w),
            Text(title, style: FonTextStyle.field14TextStyle()),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorHelper.kBlack12,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            children: [
              Text(title, style: FonTextStyle.black15400TextStyle()),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
