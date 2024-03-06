import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/Model/Widgets/common_textfomfield.dart';
import 'package:pbl/View/HomeScreen/terms_and_conditions.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final aadhaar = TextEditingController();
  final pan = TextEditingController();
  final gst = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20.h),
                Text(" TBL Form ", style: FonTextStyle.black20TextStyle()),
                const Divider(),
                SizedBox(height: 20.h),
                Container(
                  height: 180.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      border:
                          Border.all(color: ColorHelper.kBlue, width: 1.5.w),
                      borderRadius: BorderRadius.all(Radius.circular(10.r))),
                  child: Column(
                    children: [
                      Container(
                        height: 45.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: ColorHelper.kBlack12,
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorHelper.kBlue, width: 1.5.w)),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.r),
                              topRight: Radius.circular(10.r)),
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(10.0.sp),
                            child: Text("Payment",
                                style: FonTextStyle.blue16500TextStyle())),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 10.h),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                buildText("Membership Fee:"),
                                const Spacer(),
                                buildText("000 ₹"),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                buildText("GST:"),
                                const Spacer(),
                                buildText("00 ₹"),
                              ],
                            ),
                            SizedBox(height: 25.h),
                            Row(
                              children: [
                                Text("TOTAL:",
                                    style: FonTextStyle.blue16500TextStyle()),
                                const Spacer(),
                                Text("000 ₹",
                                    style: FonTextStyle.blue16500TextStyle()),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
                CommonTextFomField(
                    controller: aadhaar,
                    keyboardType: TextInputType.number,
                    labelText: "Enter Aadhaar Number "),
                SizedBox(height: 20.h),
                CommonTextFomField(
                  controller: pan,
                  keyboardType: TextInputType.visiblePassword,
                  labelText: "Enter PAN Number ",
                ),
                SizedBox(height: 20.h),
                CommonTextFomField(
                  controller: gst,
                  keyboardType: TextInputType.number,
                  labelText: "Enter GST Number ",
                ),
                SizedBox(height: 50.h),
                commonButton("Submit", ColorHelper.kBlack12, () {
                  Get.to(const TermsScreen());
                }),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Text buildText(String title) {
    return Text(title, style: FonTextStyle.black15400TextStyle());
  }
}
