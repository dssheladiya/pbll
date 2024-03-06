/*import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kr/common.dart/constant.dart';
import 'package:kr/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends GetxController {
  var isload = false.obs;
  final dio = Dio();
  RxMap userDetails = {}.obs;
  RxList packagesList = [].obs;
  RxInt currentIndex = 0.obs;
  RxBool isBlurred = false.obs;
  RxBool isBlurred1 = false.obs;

  blurHide() {
    isBlurred.value = !isBlurred.value;
  }

  blurHide1() {
    isBlurred1.value = !isBlurred1.value;
  }

  indxChange(int index) {
    currentIndex.value = index;
  }

  Future<void> userData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isload(true);
    var header = {
      'Accept': '',
      'authorization': 'Bearer ${pref.getString('token')}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await dio.get(
        '$rootUrl/api/user_details',
        options: Options(headers: header),
      );

      final data = response.data;

      debugPrint("--- userData --- $data");
      if (response.statusCode == 200) {
        isload(false);
        if ("${data["status"]}".toLowerCase() == 'success') {
          userDetails.value = data['data'];
        } else {
          MassageBox.msg("${data["msg"]}");
        }
      } else if (response.statusCode == 400) {
        pref.clear();
        Get.offAllNamed(AppPages.login);
      } else {
        isload(false);
        debugPrint("--- userData ${response.statusMessage}");
      }
    } catch (e) {
      isload(false);
      debugPrint('--- userData Error: $e');
    }
  }

  @override
  void onInit() {
    userData();
    Modules.checkConnectivity();
    super.onInit();
  }
}
*/
