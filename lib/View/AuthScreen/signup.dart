import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pbl/Controller/singup_controller.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/Model/Widgets/common_textfomfield.dart';
import 'package:pbl/View/AuthScreen/otp.dart';
import 'login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final box = GetStorage();
  final signUpController = Get.put(SignUpController());
  final _formKey = GlobalKey<FormState>();
  bool loading = false;
  bool hidePassword = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  List selectdData = [];
  List selectedPlatform = [];
  String dropDownValue = "Biasness";
  CollectionReference pbl = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore db = FirebaseFirestore.instance;

  List biasnessData = [
    "Stock Market ",
    "IT Companies  ",
    "Farmers",
    "Food & Dining ",
    "Affiliate Marketing",
    "other"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: SizedBox(
                  //     width: 200.w,
                  //     height: 200.h,
                  //     child: Image.asset("assets/images/logo.png",
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  SizedBox(height: 30.h),
                  Text(
                    "Welcome back! Glad",
                    style: buildTextStyleBlack(),
                  ),
                  Text(
                    "to see you,Again! ",
                    style: buildTextStyleBlack(),
                  ),
                  SizedBox(height: 30.h),
                  CommonTextFomField(
                    controller: signUpController.firstName,
                    keyboardType: TextInputType.name,
                    labelText: "Enter your First Name",
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter First Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.lastName,
                    keyboardType: TextInputType.name,
                    labelText: "Enter your Last Name",
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Last Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.email,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Enter your Email",
                    prefixIcon: const Icon(Icons.mail_outline),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Email';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.pass,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Enter your Password",
                    obscureText: hidePassword,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },
                      icon: hidePassword == true
                          ? const Icon(Icons.visibility_off)
                          : const Icon(Icons.visibility),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Password';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.phone,
                    keyboardType: TextInputType.number,
                    labelText: "Enter your Phone",
                    prefixIcon: const Icon(Icons.call),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Phone';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.referral,
                    keyboardType: TextInputType.name,
                    labelText: "Enter your Referral",
                    prefixIcon: const Icon(Icons.accessibility_new_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Referral';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  CommonTextFomField(
                    controller: signUpController.referralName,
                    keyboardType: TextInputType.name,
                    labelText: "Enter your Referral Name",
                    prefixIcon: const Icon(Icons.account_circle_outlined),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Place Enter Referral Name';
                      } else {
                        return null;
                      }
                    },
                  ),
                  SizedBox(height: 15.h),
                  Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color(0xffF7F7F7),
                      borderRadius: BorderRadius.all(Radius.circular(6.r)),
                      border:
                      Border.all(color: const Color(0xffE0E0E0), width: 1.5.w),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: DropdownButton(
                        hint: Text(dropDownValue),
                        isExpanded: true,
                        underline: const SizedBox(),
                        items: List.generate(
                          biasnessData.length,
                              (index) =>
                              DropdownMenuItem(
                                value: biasnessData[index],
                                child: Text("${biasnessData[index]}"),
                              ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            dropDownValue = value as String;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : commonButton(
                    "Register",
                    ColorHelper.kBlack12,
                        () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          UserCredential credential =
                          await auth.createUserWithEmailAndPassword(
                            email: signUpController.email.text,
                            password: signUpController.pass.text,
                          );
                          log("++--++${credential.user!.email}");
                          log("++--++${credential.user!.uid}");

                          setState(() {
                            loading = false;
                          });
                          auth.verifyPhoneNumber(
                            phoneNumber:
                            "+91 ${signUpController.phone.text}",
                            verificationCompleted: (phoneAuthCredential) {
                              log("verified");
                            },
                            verificationFailed: (error) {
                              log("ERROR");
                            },
                            codeSent:
                                (verificationId, forceResendingToken) {
                              Get.to(
                                  OTPScreen(
                                      resendigtoken: 4,
                                      id: verificationId,
                                      phone: signUpController.phone.text,
                                      toKen: forceResendingToken),
                                  arguments: dropDownValue);
                            },
                            codeAutoRetrievalTimeout: (verificationId) {
                              log('TIME OUT');
                            },
                          );
                          final city = {
                            "first name": signUpController.firstName.text,
                            "last name": signUpController.lastName.text,
                            "email": signUpController.email.text,
                            "password": signUpController.pass.text,
                            "phone": signUpController.phone.text,
                            "referral name":
                            signUpController.referralName.text,
                            "referral": signUpController.referral.text,
                            "biasness": dropDownValue,
                          };
                          db.collection("users").doc().set(city).onError(
                                  (e, _) =>
                                  log("Error writing document: $e"));
                        } on FirebaseAuthException catch (e) {
                          log("${e.code}");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${e.message}")));
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                  ),

                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(width: 10),
                      InkResponse(
                        onTap: () {
                          Get.to(const LoginScreen());
                        },
                        child: Text(
                          "Login Now",
                          style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  TextStyle buildTextStyleBlack() {
    return TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 25.sp,
        fontStyle: FontStyle.italic);
  }
}
