// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:pbl/Controller/singup_controller.dart';
// import 'package:pbl/Model/Constant/color_helper.dart';
// import 'package:pbl/Model/Constant/text_style.dart';
// import 'package:pbl/View/HomeScreen/BottomBar/profile_bar.dart';
//
// class DrawerScreen extends StatefulWidget {
//   const DrawerScreen({super.key});
//
//   @override
//   State<DrawerScreen> createState() => _DrawerScreenState();
// }
//
// class _DrawerScreenState extends State<DrawerScreen> {
//   final box = GetStorage();
//   final controller = Get.put(SignUpController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Drawer(
//       shape: const OutlineInputBorder(
//         borderRadius: BorderRadius.zero,
//         borderSide: BorderSide(color: Colors.transparent),
//       ),
//       backgroundColor: ColorHelper.kWhite,
//       child: ListView(
//         padding: EdgeInsets.zero,
//         children: [
//           DrawerHeader(
//             decoration: const BoxDecoration(color: ColorHelper.kBlack12),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(height: 48.h, color: Colors.white24),
//                 SizedBox(height: 10.h),
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       radius: 25.r,
//                       child: const Icon(
//                         Icons.account_circle_outlined,
//                       ),
//                     ),
//                     SizedBox(width: 10.w),
//                     const Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text("Denish"),
//                         Text("Biasness"),
//                       ],
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           buildListTile("Profile", () {
//             Get.to(const ProfileBar());
//           }, Icons.account_circle_outlined),
//           buildListTile("Membership fee", () {
//             Navigator.pop(context);
//           }, Icons.currency_rupee_outlined),
//           buildListTile("Attendance", () {}, Icons.date_range_sharp),
//           Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//           buildListTile("New Members", () {}, Icons.account_box_outlined),
//           buildListTile("GPBO Report", () {}, Icons.checklist_rtl),
//           buildListTile("Blood Request", () {}, Icons.bloodtype_outlined),
//           Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//           buildListTile("All Winner", () {}, Icons.accessibility_new_outlined),
//           buildListTile("GGF", () {}, Icons.message_outlined),
//           Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
//           buildListTile("Setting", () {
//             Get.to(const ProfileBar());
//           }, Icons.settings),
//           buildListTile("Logout", () {
//             Get.to(const ProfileBar());
//           }, Icons.login_outlined),
//         ],
//       ),
//     );
//   }
//
//   ListTile buildListTile(String title, Function()? onTap, IconData? icon) {
//     return ListTile(
//       leading: Icon(icon, size: 28.sp),
//       title: Text(title, style: FonTextStyle.fieldTextStyle()),
//       trailing: const Icon(Icons.arrow_forward_ios_outlined),
//       onTap: onTap,
//     );
//   }
//
// // leadingPopup(context) {
// //   return showDialog(
// //     context: context,
// //     builder: (context) {
// //       return AlertDialog(
// //         contentPadding: const EdgeInsets.all(10),
// //         content: Container(
// //           decoration: BoxDecoration(color: Colors.transparent),
// //           height: 350.0.h,
// //           width: 350.0.w,
// //           child: Column(
// //             children: [
// //               Text("Name : ${box.read("name")}"), SizedBox(height: 10.h),
// //               //   Text("Email : ${box.read("emial")}"),
// //               Text("Phone No: ${box.read("phone")}"), SizedBox(height: 10.h),
// //               Text("Biasness: ${Get.arguments}"), SizedBox(height: 10.h),
// //               Text("Referral :  ${box.read("referral")}"),
// //             ],
// //           ),
// //         ),
// //       );
// //     },
// //   );
// // }
// }
// // SizedBox(height: 30),
// // Text("Name : ${box.read("name")}"),
// // Text("Email : ${box.read("emial")}"),
// // Text("Phone No: ${box.read("phone")}"),
// // Text("Biasness: ${Get.arguments}"),
// // Text("Referral :  ${box.read("referral")}"),
// // Text("${box.read("phone")}"),
// // drawer: Drawer(
// //   backgroundColor: const Color(0xff34FBC4),
// //   shape: OutlineInputBorder(
// //     borderRadius: BorderRadius.zero,
// //     borderSide: BorderSide(color: Color(0xff34FBC4)),
// //   ),
// //   child: ListView(
// //     padding: EdgeInsets.zero,
// //     children: [
// //       DrawerHeader(
// //         decoration: const BoxDecoration(
// //           gradient: LinearGradient(
// //             colors: [
// //               Color(0xff34FBC4),
// //               Color(0xffFED836),
// //             ],
// //             begin: Alignment.topLeft,
// //             end: Alignment.topRight,
// //           ),
// //         ),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.account_circle_outlined,
// //                     size: 45.sp, color: Colors.lightGreenAccent),
// //                 SizedBox(width: 30.w),
// //                 Text(
// //                   "Account",
// //                   style: TextStyle(fontSize: 20.sp),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 30.h),
// //             Text(" ${box.read("name")}"),
// //           ],
// //         ),
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.home, size: 30.sp),
// //         title: Text('Home Page'),
// //         trailing: Icon(Icons.arrow_forward_ios_outlined),
// //         onTap: () {
// //           Navigator.pop(context);
// //         },
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.account_circle, size: 30.sp),
// //         title: Text('Profile'),
// //         trailing: Icon(Icons.arrow_forward_ios_outlined),
// //         onTap: () {
// //         // leadingPopup(context);
// //         },
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.security_rounded, size: 30.sp),
// //         title: Text('Security'),
// //         trailing: Icon(Icons.arrow_forward_ios_outlined),
// //         onTap: () {},
// //       ),
// //       ListTile(
// //         leading: Icon(Icons.settings, size: 30.sp),
// //         title: Text('Setting'),
// //         trailing: Icon(Icons.arrow_forward_ios_outlined),
// //         onTap: () {},
// //       ),
// //       SizedBox(height: 300.h),
// //       ListTile(
// //         leading: Icon(Icons.login_outlined, size: 30.sp),
// //         title: Text('Logout'),
// //         trailing: Icon(Icons.arrow_forward_ios_outlined),
// //         onTap: () async {
// //           await box.remove("userid");
// //           Get.to(const SplashScreen());
// //         },
// //       ),
// //     ],
// //   ),
// // ),
