import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbl/Model/Constant/text_style.dart';

Widget commonButton(String title, Color? color, Function() onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: 50.h,
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 1.w),
        borderRadius: BorderRadius.circular(6.r),
        color: color,
      ),
      child: Center(
        child: Text(title, style: FonTextStyle.black20TextStyle()),
      ),
    ),
  );
}
