import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/intro.dart';
import 'dart:async';
import 'dart:developer';

import 'package:pinput/pinput.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({
    super.key,
    required this.id,
    this.toKen,
    this.phone,
    required this.resendigtoken,
  });

  final id;
  final toKen;
  final phone;
  final int resendigtoken;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController otp = TextEditingController();

  int second = 30;
  bool isResend = false;
  String? otpCode;

  void timerDemo() {
    Timer timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {});

      second--;
      if (second == 0) {
        timer.cancel();
        setState(() {
          second = 60;
          isResend = true;
        });
      }
    });
  }

  @override
  void initState() {
    timerDemo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Column(
            children: [
              SizedBox(height: 30.h),
              Text(
                'Varification OTP',
                style: buildTextStyleBlack(),
              ),
              Center(
                child: Text(
                  '${widget.phone}',
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                'Please check your OTP',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10.h),
              Text(
                "Enter the 6 digit varification code",
                style: FonTextStyle.field14300TextStyle(),
              ),
              SizedBox(height: 10.h),
              Pinput(
                length: 6,
                controller: otp,
                showCursor: true,
                defaultPinTheme: PinTheme(
                  width: 50.w,
                  height: 48.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.r),
                    border: Border.all(color: Colors.black, width: 1.w),
                  ),
                  textStyle:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 20.sp),
                ),
                onSubmitted: (value) {
                  setState(() {
                    otpCode = value;
                  });
                },
              ),
              SizedBox(height: 20.h),
              commonButton(
                "Verify",
                ColorHelper.kBlack12,
                () async {
                  try {
                    PhoneAuthCredential credential =
                        PhoneAuthProvider.credential(
                            verificationId: widget.id, smsCode: otp.text);
                    UserCredential userCredential =
                        await auth.signInWithCredential(credential);
                    print('${userCredential.user!.phoneNumber}');
                    print('${userCredential.user!.uid}');
                    Get.to(IntroScreen());
                  } on FirebaseException catch (e) {
                    print('${e.code}');
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${e.message}'),
                      ),
                    );
                  }
                },
              ),
              SizedBox(height: 20.h),
              Text(
                '${second}',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 27.sp),
              ),
              SizedBox(height: 20.h),
              isResend
                  ? Center(
                      child: commonButton(
                        "Resend Otp",
                        ColorHelper.kBlack12,
                        () async {
                          auth.verifyPhoneNumber(
                            phoneNumber: "+91 ${widget.phone}",
                            verificationCompleted: (phoneAuthCredential) {
                              log("verified");
                            },
                            verificationFailed: (error) {
                              log("eeeeeeeeeeeeeeeeeeeeeERROR");
                            },
                            codeSent: (verificationId, forceResendingToken) {
                              setState(
                                () {
                                  Get.to(OTPScreen(
                                      id: verificationId,
                                      phone: otp.text,
                                      resendigtoken: 4,
                                      toKen: forceResendingToken));
                                },
                              );
                            },
                            codeAutoRetrievalTimeout: (String verificationId) {
                              log("Time out");
                            },
                            forceResendingToken: widget.toKen,
                          );
                          setState(() {});
                          isResend = false;
                          timerDemo();
                        },
                      ),
                    )
                  : const SizedBox(),
            ],
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
