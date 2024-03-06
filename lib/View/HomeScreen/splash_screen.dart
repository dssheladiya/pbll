import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:lottie/lottie.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/View/HomeScreen/BottomBar/home_screen.dart';
import 'package:pbl/View/HomeScreen/splash_one_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer timer = Timer(
      const Duration(seconds: 7),
          () =>
      box.read('userid') == null
          ? Get.to(const SplashOneScreen())
          : Get.to(const HomeScreen()),
    );
    super.initState();
  }

  int selected = 0;
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Lottie.network(
                "https://assets2.lottiefiles.com/packages/lf20_AMBEWz.json"),
          ),
        ],
      ),
    );
  }
}
