/*import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kr/common.dart/constant.dart';
import 'package:kr/home/home_con.dart';
import 'package:kr/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.dullColors,
      shape: const OutlineInputBorder(
        borderRadius: BorderRadius.zero,
        borderSide: BorderSide(color: AppColors.borderColors),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(topRight: Radius.circular(20)),
              gradient: LinearGradient(
                colors: [
                  Color(0xff34FBC4),
                  Color(0xffFED836),
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              ),
            ),
            child: Center(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                minLeadingWidth: 50,
                leading: const CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage("assets/profile_img3.png"),
                ),
                title: Text(
                  homeController.userDetails['fullname'] ?? "",
                  style: AppTextStyle.black16w400,
                ),
                subtitle: Text(
                  homeController.userDetails['loginid'] ?? "",
                  style: AppTextStyle.black14w500,
                ),
                // trailing: SvgPicture.asset("assets/drawer/edit_black.svg"),
              ),
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      commonFunc(
                        svg: "assets/drawer/dashboard.svg",
                        title: "Dashboard",
                        onTap: () {
                          homeController.indxChange(0);
                          Get.back();
                        },
                      ),
                      commonFunc(
                        svg: "assets/drawer/profile_grey.svg",
                        title: "Profile",
                        onTap: () {
                          homeController.indxChange(3);
                          Get.back();
                        },
                      ),
                      commonFunc(
                        svg: "assets/home/wallet.svg",
                        title: "Wallet",
                        onTap: () {
                          homeController.indxChange(2);
                          Get.back();
                        },
                      ),
                      commonFunc(
                        svg: "assets/drawer/server.svg",
                        title: "Server",
                        onTap: () {
                          homeController.indxChange(1);
                          Get.back();
                          // Get.offAndToNamed(AppPages.server);
                        },
                      ),
                      commonFunc(
                        svg: "assets/drawer/rewards.svg",
                        title: "Reward",
                        onTap: () {
                          Get.toNamed(AppPages.Reward);
                          // widget.scafold.currentState!.closeDrawer();
                        },
                      ),
                      // commonFunc(
                      //   svg: "assets/drawer/reports.svg",
                      //   title: "Report",
                      //   onTap: () {
                      //     // Get.toNamed(AppPages.FAQs);
                      //     // widget.scafold.currentState!.closeDrawer();
                      //   },
                      // ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: Column(
                    children: [
                      // commonFunc(
                      //   svg: "assets/profile/settings.svg",
                      //   title: "Settings",
                      //   onTap: () {
                      //     // Get.toNamed(AppPages.FAQs);
                      //     // widget.scafold.currentState!.closeDrawer();
                      //   },
                      // ),
                      commonFunc(
                        svg: "assets/profile/logout.svg",
                        title: "Logout",
                        onTap: () {
                          SharedPreferences.getInstance().then((value) {
                            value.clear();
                          });
                          Get.offAllNamed(AppPages.login);
                          // widget.scafold.currentState!.closeDrawer();
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  commonFunc({required String title, required String svg, required onTap}) {
    return ListTile(
      onTap: onTap,
      leading: SvgPicture.asset(svg, height: 19),
      title: Text(
        title,
        style: AppTextStyle.grey16w400,
      ),
      trailing: const Icon(Icons.arrow_forward_ios_outlined,
          color: AppColors.greyColors, size: 18),
    );
  }
}
*/
