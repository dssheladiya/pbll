/*import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:kr/History/history_con.dart';
import 'package:kr/common.dart/constant.dart';
import 'package:kr/home/home_con.dart';
import 'package:kr/routes/app_pages.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen>
    with SingleTickerProviderStateMixin {
  HomeController homeController = Get.put(HomeController());
  HistoryController historyController = Get.put(HistoryController());
  // TabController? _tabController;
  List tab = ["Income", "Server"];

  @override
  void initState() {
    // _tabController = TabController(length: tab.length, vsync: this);
    // homeController.userData();
    super.initState();
  }

  int currentIndex = 0;
  List gridView = [
    {
      "backimg": "assets/home/active_server.png",
      "img": "assets/home/active_back1.svg",
      "name": "Active Server",
      "amount": "8",
    },
    {
      "backimg": "assets/home/mining_server.png",
      "img": "assets/home/mining_back1.svg",
      "name": "Mining Reward",
      "amount": "\$8,000",
    },
    {
      "backimg": "assets/home/nimting_server.png",
      "img": "assets/home/minting_back1.svg",
      "name": "Referral Reward",
      "amount": "\$1,000",
    },
    {
      "backimg": "assets/home/refrel_rewards.png",
      "img": "assets/home/referall_back1.svg",
      "name": "Minting Reward",
      "amount": "\$2,000",
    },
  ];

  Future<void> _pullRefresh() async {
    return Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        homeController.userData();
        historyController.depositHistory();
        historyController.withdrawHistory();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        backgroundColor: AppColors.blackColors,
        body: RefreshIndicator(
          strokeWidth: 3,
          color: AppColors.whiteColors,
          displacement: 50,
          backgroundColor: AppColors.blackColors,
          onRefresh: _pullRefresh,
          child: Container(
            alignment: Alignment.topCenter,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      "assets/home/back_img1.png",
                    ),
                    alignment: Alignment.topCenter)),
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: 200.h),
                  Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.3,
                    padding:
                        const EdgeInsets.only(top: 35, left: 20, right: 15),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/home/home_total.png",
                          ),
                          fit: BoxFit.contain),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    GestureDetector(
                                        onTap: () {
                                          homeController.blurHide();
                                        },
                                        child: homeController.isBlurred.value
                                            ? SvgPicture.asset(
                                                "assets/home/invisibale_white.svg",
                                                height: 20,
                                                color: AppColors.blackColors,
                                              )
                                            : SvgPicture.asset(
                                                "assets/wallet/visibale_black.svg")),
                                    const SizedBox(width: 5),
                                    Text("your Balance",
                                        style: AppTextStyle.black14w500)
                                  ],
                                ),
                                const SizedBox(height: 10),
                                Row(
                                  children: [
                                    Text(
                                        "${homeController.userDetails["pinwallet"] ?? 0}",
                                        style: homeController.isBlurred.value
                                            ? TextStyle(
                                                fontSize: 26,
                                                fontWeight: FontWeight.w600,
                                                foreground: Paint()
                                                  ..style = PaintingStyle.fill
                                                  ..color =
                                                      AppColors.blackColors
                                                  ..maskFilter =
                                                      const MaskFilter.blur(
                                                          BlurStyle.normal, 6))
                                            : AppTextStyle.black26w600),
                                    const SizedBox(width: 5),
                                    Text(
                                      "USDT",
                                      style: AppTextStyle.black16w400,
                                      textAlign: TextAlign.end,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 35),
                          child: Row(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(AppPages.deposite);
                                  },
                                  style: ElevatedButton.styleFrom(
                                      alignment: Alignment.center,
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8))),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SvgPicture.asset(
                                          "assets/home/up_arrow_black.svg"),
                                      const SizedBox(
                                        width: 3,
                                      ),
                                      Text(
                                        "Deposit",
                                        style: AppTextStyle.black16w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.39,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Get.toNamed(AppPages.withdraw);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    alignment: Alignment.center,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(8)),
                                    backgroundColor: AppColors.dullColors,
                                  ),
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        "assets/wallet/withdraw.svg",
                                        height: 20,
                                      ),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        "Withdraw",
                                        style: AppTextStyle.white16w400,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      childAspectRatio: 0.98,
                    ),
                    children: List.generate(gridView.length, (index) {
                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                      "${gridView[index]["backimg"]}",
                                    ),
                                    fit: BoxFit.fill),
                                borderRadius: BorderRadius.circular(10)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SvgPicture.asset("${gridView[index]["img"]}"),
                                const SizedBox(height: 10),
                                Expanded(
                                  child: Text(
                                      "${gridView[index]["name"]}"
                                          .toString()
                                          .replaceAll(" ", "\n"),
                                      style: AppTextStyle.white14w400),
                                ),
                                Text(
                                  index == 0
                                      ? "${homeController.userDetails["active_server"] ?? 0}"
                                      : index == 1
                                          ? "${homeController.userDetails["mining_reward"] ?? 0}"
                                          : index == 2
                                              ? "${homeController.userDetails["referral_reward"] ?? 0}"
                                              : "${homeController.userDetails["team_mining_reward"] ?? 0}",
                                  style: AppTextStyle.white24w400,
                                )
                              ],
                            )),
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.26,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                            image: AssetImage(
                              "assets/home/commision.png",
                            ),
                            fit: BoxFit.cover)),
                    child: Padding(
                      padding: const EdgeInsets.only(
                          top: 30, bottom: 0, left: 15, right: 15),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      GestureDetector(
                                          onTap: () {
                                            homeController.blurHide1();
                                          },
                                          child: homeController.isBlurred1.value
                                              ? SvgPicture.asset(
                                                  "assets/home/invisibale_white.svg",
                                                  height: 20,
                                                )
                                              : SvgPicture.asset(
                                                  "assets/home/visibale_white.svg")),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "Total Commission Withdraw",
                                        style: AppTextStyle.white16w400,
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                          "${homeController.userDetails["commission_Wallet"] ?? 0}",
                                          style: homeController.isBlurred1.value
                                              ? TextStyle(
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.w400,
                                                  foreground: Paint()
                                                    ..style = PaintingStyle.fill
                                                    ..color =
                                                        AppColors.whiteColors
                                                    ..maskFilter =
                                                        const MaskFilter.blur(
                                                            BlurStyle.normal,
                                                            6))
                                              : AppTextStyle.white24w400),
                                      const SizedBox(width: 5),
                                      Text(
                                        "USDT",
                                        style: AppTextStyle.white16w400,
                                        textAlign: TextAlign.end,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       "History",
                  //       style: AppTextStyle.white20w500,
                  //     ),
                  //     GestureDetector(
                  //       onTap: () {
                  //         Get.toNamed(AppPages.homeHistory);
                  //       },
                  //       child: Text(
                  //         "See All",
                  //         style: AppTextStyle.grey14w400,
                  //       ),
                  //     )
                  //   ],
                  // ),
                  // const SizedBox(height: 10),

                  // Container(
                  //   width: MediaQuery.of(context).size.width * 0.92,
                  //   height: MediaQuery.of(context).size.height * 0.07,
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //         topLeft: Radius.circular(15),
                  //         topRight: Radius.circular(15)),
                  //     gradient: LinearGradient(
                  //       colors: [
                  //         Color(0xff34FBC4),
                  //         Color(0xffFED836),
                  //       ],
                  //       begin: Alignment.topLeft,
                  //       end: Alignment.topRight,
                  //     ),
                  //   ),
                  //   child: TabBar(
                  //     onTap: (val) {
                  //       setState(() {
                  //         currentIndex = val;
                  //       });
                  //     },
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     indicatorColor: Colors.transparent,
                  //     labelPadding: EdgeInsets.zero,
                  //     dividerColor: Colors.transparent,
                  //     indicatorWeight: 0.5,
                  //     overlayColor:
                  //         const MaterialStatePropertyAll(Colors.transparent),
                  //     isScrollable: false,
                  //     controller: _tabController,
                  //     tabs: List.generate(
                  //       tab.length,
                  //       (index) {
                  //         return Text(
                  //           tab[index],
                  //           style: (currentIndex == index)
                  //               ? AppTextStyle.black14w500
                  //               : AppTextStyle.grey14w500,
                  //         );
                  //       },
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: MediaQuery.of(context).size.height,
                  //   child: TabBarView(
                  //     controller: _tabController,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     children: [income(), server()],
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  server() {
    return DataTable(
      columnSpacing: 30, // Adjust the spacing between columns
      border: TableBorder.all(color: AppColors.borderColors, width: 1),
      headingRowColor: const MaterialStatePropertyAll(AppColors.dullColors),
      dataRowMaxHeight: 60,
      dividerThickness: 1,
      columns: [
        DataColumn(
          label: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Time',
              style: AppTextStyle.grey14w400,
            ),
          ),
        ),
        DataColumn(
          label: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Type\nServer',
              style: AppTextStyle.grey14w400,
            ),
          ),
        ),
        DataColumn(
          label: Container(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Price',
              style: AppTextStyle.grey14w400,
            ),
          ),
        ),
      ],
      rows: List.generate(
        10,
        (index) => DataRow(
          cells: [
            DataCell(Text(
              'Oct 25  5:25PM',
              style: AppTextStyle.grey12w400,
            )),
            DataCell(Row(
              children: [
                SvgPicture.asset("assets/home/server_vs1.svg"),
                const SizedBox(
                  width: 8,
                ),
                Text('Server_VS1', style: AppTextStyle.white14w400),
              ],
            )),
            DataCell(Text('\$200', style: AppTextStyle.white14w400)),
          ],
        ),
      ),
    );
  }

  income() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: DataTable(
        columnSpacing: 30, // Adjust the spacing between columns
        border: TableBorder.all(color: AppColors.borderColors, width: 1),
        headingRowColor: const MaterialStatePropertyAll(AppColors.dullColors),
        dataRowMaxHeight: 60,
        dividerThickness: 1,

        columns: [
          DataColumn(
            label: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Time',
                style: AppTextStyle.grey14w400,
              ),
            ),
          ),
          DataColumn(
            label: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Income\nServer',
                style: AppTextStyle.grey14w400,
              ),
            ),
          ),
          DataColumn(
            label: Container(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                'Income Server',
                style: AppTextStyle.grey14w400,
              ),
            ),
          ),
        ],
        rows: List.generate(
          10,
          (index) => DataRow(
            cells: [
              DataCell(Text(
                'Oct 25 \n5:25PM',
                style: AppTextStyle.grey12w400,
              )),
              DataCell(
                Text('\$2000', style: AppTextStyle.white14w400),
              ),
              DataCell(Text('Server_VS1', style: AppTextStyle.white14w400)),
            ],
          ),
        ),
      ),
    );
  }
}
*/
