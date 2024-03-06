import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/View/AuthScreen/login.dart';
import 'package:pbl/View/AuthScreen/signup.dart';

class SplashOneScreen extends StatefulWidget {
  const SplashOneScreen({super.key});

  @override
  State<SplashOneScreen> createState() => _SplashOneScreenState();
}

class _SplashOneScreenState extends State<SplashOneScreen> {
  int selected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  width: 350.w,
                  height: 350.h,
                  child: Image.asset("assets/images/logo.png"),
                ),
                SizedBox(height: 50.h),
                GestureDetector(
                  onTap: () {
                    Get.to(const LoginScreen());
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      //color: selected == 0 ? Colors.black : Colors.white,
                        color: Colors.black,
                        border: Border.all(color: Colors.amber, width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
                GestureDetector(
                  onTap: () {
                    Get.to(const SignUpScreen());
                  },
                  child: Container(
                    height: 50.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      // color: selected == 0 ? Colors.white : Colors.black,
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.w),
                        borderRadius: BorderRadius.all(Radius.circular(5.r))),
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.sp,
                            fontStyle: FontStyle.italic),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                Text(
                  "Continue to a guest",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 15.sp,
                      fontStyle: FontStyle.italic),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
