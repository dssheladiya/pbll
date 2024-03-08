// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:pbl/Model/Constant/text_style.dart';
// import 'package:pbl/View/HomeScreen/BottomBar/business_bar.dart';
// import 'package:pbl/View/HomeScreen/BottomBar/home_bar.dart';
// import 'package:pbl/View/HomeScreen/BottomBar/profile_bar.dart';
// import 'package:pbl/Model/Constant/color_helper.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   int currentIndex = 0;
//   List screenList = [
//     const HomeBar(),
//     const BusinessBar(),
//     // const ReportBar(),
//     const ProfileBar()
//   ];
//   List text = [
//     "Home",
//     "Form",
//     //"Report",
//     "Profile",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: ColorHelper.kWhite,
//       //key: _scaffoldKey,
//       drawer: Drawer(
//         shape: const OutlineInputBorder(
//           borderRadius: BorderRadius.zero,
//           borderSide: BorderSide(color: Colors.transparent),
//         ),
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: [
//             DrawerHeader(
//               decoration: const BoxDecoration(color: ColorHelper.kBlack12),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Container(height: 48.h, color: Colors.white24),
//                   SizedBox(height: 10.h),
//                   Row(
//                     children: [
//                       CircleAvatar(
//                         radius: 25.r,
//                         child: const Icon(
//                           Icons.account_circle_outlined,
//                         ),
//                       ),
//                       SizedBox(width: 10.w),
//                       const Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Denish"),
//                           Text("Biasness name"),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//             buildListTile("Profile", () {
//               setState(() {});
//               //  currentIndex == 2 ? Navigator.pop(context) : SizedBox();
//             }, Icons.account_circle_outlined),
//             buildListTile("Membership fee", () {
//               Navigator.pop(context);
//             }, Icons.currency_rupee_outlined),
//             buildListTile("Attendance", () {}, Icons.date_range_sharp),
//             Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//             buildListTile("New Members", () {}, Icons.account_box_outlined),
//             buildListTile("GPBO Report", () {}, Icons.checklist_rtl),
//             buildListTile("Blood Request", () {}, Icons.bloodtype_outlined),
//             Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//             buildListTile(
//                 "All Winner", () {}, Icons.accessibility_new_outlined),
//             buildListTile("GGF", () {}, Icons.message_outlined),
//             Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//             buildListTile("Setting", () {
//               Get.to(const ProfileBar());
//             }, Icons.settings),
//             buildListTile("Logout", () {
//               Get.to(const ProfileBar());
//             }, Icons.login_outlined),
//           ],
//         ),
//       ),
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           text[currentIndex],
//           style: FonTextStyle.black15400TextStyle(),
//         ),
//         actions: [
//           const Icon(Icons.more_vert),
//           SizedBox(width: 10.w),
//         ],
//         backgroundColor: const Color(0xff34FBC4),
//       ),
//       bottomNavigationBar: NavigationBar(
//         indicatorColor: Colors.transparent,
//         selectedIndex: currentIndex,
//         onDestinationSelected: (int index) {
//           setState(() {
//             currentIndex = index;
//           });
//         },
//         destinations: const <NavigationDestination>[
//           NavigationDestination(
//             selectedIcon: Icon(Icons.home, size: 30),
//             icon: Icon(Icons.home_outlined),
//             label: '',
//           ),
//           NavigationDestination(
//             selectedIcon: Icon(Icons.wallet_travel, size: 30),
//             icon: Icon(Icons.wallet_travel_outlined),
//             label: '',
//           ),
//           // NavigationDestination(
//           //   selectedIcon: Icon(Icons.checklist_rtl, size: 30),
//           //   icon: Icon(Icons.checklist_rtl),
//           //   label: '',
//           // ),
//           NavigationDestination(
//             selectedIcon: Icon(Icons.person, size: 30),
//             icon: Icon(Icons.person_outline),
//             label: '',
//           ),
//         ],
//       ),
//       body: screenList[currentIndex],
//     );
//   }
//
//   ListTile buildListTile(String title, Function()? onTap, IconData? icon) {
//     return ListTile(
//       leading: Icon(icon, size: 28.sp),
//       title: Text(title, style: FonTextStyle.field14300TextStyle()),
//       trailing: const Icon(Icons.arrow_forward_ios_outlined),
//       onTap: onTap,
//     );
//   }
// }
// //Column(
// //               children: [
// //                 SizedBox(height: 20.h),
// //                 Text(" TBL Form ", style: FonTextStyle.black20TextStyle()),
// //                 const Divider(),
// //                 SizedBox(height: 20.h),
// //                 Container(
// //                   height: 160.h,
// //                   width: double.infinity,
// //                   decoration: BoxDecoration(
// //                       border:
// //                           Border.all(color: ColorHelper.kBlue, width: 1.5.w),
// //                       borderRadius: BorderRadius.all(Radius.circular(10.r))),
// //                   child: Column(
// //                     children: [
// //                       Container(
// //                         height: 45.h,
// //                         width: double.infinity,
// //                         decoration: BoxDecoration(
// //                           color: ColorHelper.kBlack12,
// //                           border: Border(
// //                               bottom: BorderSide(
// //                                   color: ColorHelper.kBlue, width: 1.5.w)),
// //                           borderRadius: BorderRadius.only(
// //                               topLeft: Radius.circular(10.r),
// //                               topRight: Radius.circular(10.r)),
// //                         ),
// //                         child: Padding(
// //                             padding: EdgeInsets.all(10.0.sp),
// //                             child: Text("Payment",
// //                                 style: FonTextStyle.blue16500TextStyle())),
// //                       ),
// //                       Padding(
// //                         padding: EdgeInsets.symmetric(
// //                             horizontal: 20.w, vertical: 10.h),
// //                         child: Column(
// //                           children: [
// //                             Row(
// //                               children: [
// //                                 buildText("Membership Fee:"),
// //                                 const Spacer(),
// //                                 buildText("285 ₹"),
// //                               ],
// //                             ),
// //                             SizedBox(height: 10.h),
// //                             Row(
// //                               children: [
// //                                 buildText("GST:"),
// //                                 const Spacer(),
// //                                 buildText("15 ₹"),
// //                               ],
// //                             ),
// //                             SizedBox(height: 10.h),
// //                             Row(
// //                               children: [
// //                                 Text("TOTAL:",
// //                                     style: FonTextStyle.blue16500TextStyle()),
// //                                 const Spacer(),
// //                                 Text("300 ₹",
// //                                     style: FonTextStyle.blue16500TextStyle()),
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //                 SizedBox(height: 30.h),
// //                 CommonTextFomField(
// //                     controller: aadhaar,
// //                     keyboardType: TextInputType.number,
// //                     labelText: "Enter Aadhaar Number "),
// //                 SizedBox(height: 20.h),
// //                 CommonTextFomField(
// //                   controller: pan,
// //                   keyboardType: TextInputType.name,
// //                   labelText: "Enter Addresh ",
// //                 ),
// //                 SizedBox(height: 50.h),
// //                 commonButton("Submit", ColorHelper.kBlack12, () {
// //                   Get.to(const TermsScreen());
// //                 }),
// //                 SizedBox(height: 20.h),
// //               ],
// //             ),
