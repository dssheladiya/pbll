import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final pass = TextEditingController();
  final biasness = TextEditingController();
  final phone = TextEditingController();
  final referral = TextEditingController();
  final referralName = TextEditingController();
}
