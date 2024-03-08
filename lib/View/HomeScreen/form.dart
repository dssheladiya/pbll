import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
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
  final area = TextEditingController();
  final cityy = TextEditingController();
  final state = TextEditingController();
  final fullName = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  bool loading = false;
  CollectionReference pbl = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20.h),
                  Center(
                      child: Text(" TBL Form ",
                          style: FonTextStyle.black20TextStyle())),
                  const Divider(),
                  SizedBox(height: 20.h),
                  Container(
                    height: 160.h,
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
                                  buildText("285 ₹"),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  buildText("GST:"),
                                  const Spacer(),
                                  buildText("15 ₹"),
                                ],
                              ),
                              SizedBox(height: 10.h),
                              Row(
                                children: [
                                  Text("TOTAL:",
                                      style: FonTextStyle.blue16500TextStyle()),
                                  const Spacer(),
                                  Text("300 ₹",
                                      style: FonTextStyle.blue16500TextStyle()),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25.h),
                  Text("Add to Address ",
                      style: FonTextStyle.field14300TextStyle()),
                  SizedBox(height: 10.h),
                  CommonTextFomField(
                    controller: fullName,
                    keyboardType: TextInputType.name,
                    labelText: "Enter Full Name ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Full Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  CommonTextFomField(
                    controller: area,
                    keyboardType: TextInputType.name,
                    labelText: "Enter Area/Village ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place EnterArea/Village';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  CommonTextFomField(
                    controller: cityy,
                    keyboardType: TextInputType.name,
                    labelText: "Enter Town/City ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Town/City';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 20.h),
                  CommonTextFomField(
                    controller: state,
                    keyboardType: TextInputType.name,
                    labelText: "Enter State ",
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter State';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 30.h),
                  commonButton("Submit", ColorHelper.kBlack12, () async {
                    if (_formKey.currentState!.validate()) {
                      final city = {
                        "Address": state.text,
                        "City": cityy.text,
                        "Area": area.text,
                        "FullName": fullName.text,
                      };
                      db
                          .collection("users")
                          .doc()
                          .set(city)
                          .onError((e, _) => log("Error writing document: $e"));
                      Get.to(const TermsScreen());
                    }
                  }),
                  SizedBox(height: 20.h),
                ],
              ),
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
