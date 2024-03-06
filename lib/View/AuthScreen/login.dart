import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pbl/Controller/login_controller.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/Model/Widgets/common_textfomfield.dart';
import 'package:pbl/View/AuthScreen/signup.dart';
import 'package:pbl/View/HomeScreen/BottomBar/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final box = GetStorage();
  bool hidePassword = false;

  bool loading = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  final loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Center(
                  //   child: SizedBox(
                  //     width: 250.w,
                  //     height: 250.h,
                  //     child: Image.asset("assets/images/logo.png",
                  //         fit: BoxFit.cover),
                  //   ),
                  // ),
                  SizedBox(height: 40.h),
                  Text(
                    "Welcome back! Glad",
                    style: buildTextStyleBlack(),
                  ),
                  Text(
                    "to see you,Again! ",
                    style: buildTextStyleBlack(),
                  ),
                  SizedBox(height: 40.h),
                  CommonTextFomField(
                    controller: loginController.email,
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

                  SizedBox(height: 20.h),
                  CommonTextFomField(
                    controller: loginController.pass,
                    keyboardType: TextInputType.emailAddress,
                    labelText: "Enter your password",
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

                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      const Spacer(),
                      Text(
                        "Forgot Password",
                        style: TextStyle(
                            color: ColorHelper.kRed,
                            fontWeight: FontWeight.w300,
                            fontStyle: FontStyle.italic,
                            fontSize: 15.sp),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  loading
                      ? const Center(child: CircularProgressIndicator())
                      : commonButton(
                    "Login",
                    ColorHelper.kBlack12,
                        () async {
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          loading = true;
                        });
                        try {
                          UserCredential credential =
                          await auth.signInWithEmailAndPassword(
                              email: loginController.email.text,
                              password: loginController.pass.text);

                          log("++-*****-++${credential.user!.email}");
                          log("++-+++++-++${credential.user!.uid}");

                          await box.write(
                              "userid", "${credential.user!.uid}");
                          setState(() {
                            loading = false;
                          });
                          Get.to(const HomeScreen());
                          //Get.to( HomeScreen(userid: credential.user!.uid));
                        } on FirebaseAuthException catch (e) {
                          log("=========${e.code}");
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("${e.message}")));
                          setState(() {
                            loading = false;
                          });
                        }
                      }
                    },
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.sp,
                            fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(width: 10),
                      InkResponse(
                        onTap: () {
                          Get.to(const SignUpScreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: ColorHelper.kRed,
                              fontWeight: FontWeight.w500,
                              fontSize: 17.sp,
                              fontStyle: FontStyle.italic),
                        ),
                      ),
                    ],
                  ),
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
