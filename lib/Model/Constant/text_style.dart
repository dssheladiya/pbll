import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbl/Model/Constant/color_helper.dart';

class FonTextStyle {
  static TextStyle black20TextStyle() {
    return TextStyle(
        color: ColorHelper.kBlack,
        fontWeight: FontWeight.bold,
        fontSize: 20.sp,
        fontStyle: FontStyle.italic);
  }

  static TextStyle field14300TextStyle() {
    return TextStyle(
        color: ColorHelper.kBlack,
        fontSize: 14.sp,
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.italic);
  }

  static TextStyle field14TextStyle() {
    return TextStyle(
        color: ColorHelper.kWhite70,
        fontSize: 16.sp,
        fontWeight: FontWeight.normal,
        fontStyle: FontStyle.italic);
  }

  static TextStyle black15400TextStyle() {
    return TextStyle(
        color: ColorHelper.kBlack,
        fontWeight: FontWeight.w400,
        fontSize: 15.sp,
        fontStyle: FontStyle.italic);
  }

  static TextStyle blue16500TextStyle() {
    return TextStyle(
        color: ColorHelper.kBlue,
        fontWeight: FontWeight.w500,
        fontSize: 16.sp,
        fontStyle: FontStyle.italic);
  }

  //fieldTextStyle
  // static TextStyle black12TextStyle() {
  //   return const TextStyle(
  //       color: ColorHelper.kblueGrey, fontFamily: "Poly", fontSize: 14);
  // }
  //
  // static TextStyle redTextStyle() {
  //   return TextStyle(
  //       color: ColorHelper.KRed, fontFamily: "Poly", fontSize: 21.sp);
  // }
  //
  // static TextStyle blueTextStyle() {
  //   return TextStyle(
  //       color: const Color(0xff00529B), fontFamily: "Poly", fontSize: 26.sp);
  // }
  //
  // static TextStyle blue2TextStyle() {
  //   return TextStyle(
  //       color: const Color(0xff00529B), fontFamily: "Poly", fontSize: 15.sp);
  // }
  //
  // /// title Text
  // static TextStyle blackTextStyle() {
  //   return TextStyle(fontFamily: "Poly", fontSize: 20.sp, color: Colors.black);
  // }
  //
  // static TextStyle appBarTextStyle() {
  //   return TextStyle(
  //       fontFamily: "Poly", color: ColorHelper.kBlack, fontSize: 16.sp);
  // }

  static TextStyle black40SpTextStyle() {
    return TextStyle(fontFamily: "Poly", fontSize: 16.sp);
  }

// static TextStyle black18TextStyle() {
//   return TextStyle(
//       fontFamily: "Poly", color: ColorHelper.kgrey, fontSize: 20.sp);
// }

// static TextStyle font33TextStyle() {
//   return TextStyle(
//       fontFamily: 'Poly', color: ColorHelper.KBlack, fontSize: 14.sp);
// }
}
