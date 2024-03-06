/*import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kr/Drawer/drawer.dart';
import 'package:kr/History/history_con.dart';
import 'package:kr/Server/server_screen.dart';
import 'package:kr/common.dart/constant.dart';
import 'package:kr/home/home_con.dart';
import 'package:kr/home/home_page_screen.dart';
import 'package:kr/routes/app_pages.dart';
import 'package:kr/wallet/wallet_screen.dart';
import '../Profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  HistoryController historyController = Get.put(HistoryController());
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  List screenList = [
    const HomePageScreen(),
    const SereverScreen(),
    const WalletScreen(),
    const ProfileScreen()
  ];

  List iconsList = [
    {
      "svg": "assets/home/home.svg",
      "fillSvg": "assets/home/home_fill.svg",
      "name": "Home"
    },
    {
      "svg": "assets/home/server.svg",
      "fillSvg": "assets/home/server_fill.svg",
      "name": "Withdraw"
    },
    {
      "svg": "assets/home/wallet.svg",
      "fillSvg": "assets/home/wallet_fill.svg",
      "name": "Wallet"
    },
    {
      "svg": "assets/home/profile.svg",
      "fillSvg": "assets/home/profile_fill.svg",
      "name": "Profile"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        key: _scaffoldKey,
        drawer: const DrawerScreen(),
        extendBodyBehindAppBar:
            homeController.currentIndex.value == 3 ? true : false,
        backgroundColor: AppColors.blackColors,
        appBar: AppBar(
          backgroundColor: homeController.currentIndex.value == 3
              ? Colors.transparent
              : AppColors.blackColors,
          surfaceTintColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 15,
          leadingWidth: 50,
          centerTitle: homeController.currentIndex.value == 3 ? true : false,
          leading: homeController.currentIndex.value == 3
              ? null
              : GestureDetector(
                  onTap: () {
                    _scaffoldKey.currentState!.openDrawer();
                  },
                  child: const Padding(
                    padding: EdgeInsets.all(8),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/profile_img3.png"),
                    ),
                  )
                  //  Container(
                  //   margin:
                  //       const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  //   decoration: BoxDecoration(
                  //     shape: BoxShape.circle,
                  //     border: Border.all(color: AppColors.blackColors),
                  //     image: const DecorationImage(
                  //       image: AssetImage("assets/profile_img3.png"),
                  //     ),
                  //   ),
                  // ),
                  ),
          title: homeController.currentIndex.value == 3
              ? const Text("Profile",
                  style: TextStyle(fontSize: 16, color: AppColors.blackColors))
              : Text(
                  homeController.userDetails['fullname'] ?? "",
                  style: AppTextStyle.white14w500,
                ),
          actions: [
            homeController.currentIndex.value == 1
                ? Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(AppPages.historyServer);
                      },
                      child: SvgPicture.asset("assets/server/history.svg"),
                    ),
                  )
                : Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: GestureDetector(
                        onTap: () {
                          Get.toNamed(AppPages.QrScanner);
                        },
                        child: SvgPicture.asset(
                          "assets/home/scanner.svg",
                          color: homeController.currentIndex.value == 3
                              ? AppColors.blackColors
                              : null,
                        )),
                  ),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Container(
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.borderColors, width: 1),
                borderRadius: BorderRadius.circular(15),
                color: AppColors.dullColors),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                iconsList.length,
                (i) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        homeController.indxChange(i);
                      },
                      child: Container(
                        color: Colors.transparent,
                        child: SvgPicture.asset(
                            homeController.currentIndex.value == i
                                ? iconsList[i]["fillSvg"]
                                : iconsList[i]["svg"]),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
        body: screenList[homeController.currentIndex.value],
      ),
    );
  }
}
*/
