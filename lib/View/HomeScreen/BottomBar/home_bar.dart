import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:pbl/Controller/singup_controller.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/BottomBar/business_bar.dart';
import 'package:pbl/View/HomeScreen/BottomBar/profile_bar.dart';

class HomeBar extends StatefulWidget {
  const HomeBar({super.key});

  //final String userid;

  @override
  State<HomeBar> createState() => _HomeBarState();
}

class _HomeBarState extends State<HomeBar> {
  final box = GetStorage();
  final controller = Get.put(SignUpController());

  // DocumentReference? users;

  //
  // @override
  // void initState() {
  //   // users = FirebaseFirestore.instance.collection('users').doc(widget.userid);
  //   super.initState();
  // }

  // Future<void> fetchUsers() {
  //   CollectionReference users = FirebaseFirestore.instance.collection('users');
  //
  //   return users.get().then((QuerySnapshot snapshot) {
  //     snapshot.docs.forEach((doc) {
  //       print('${doc.id} => ${doc.data()}');
  //     });
  //   }).catchError((error) => print("Failed to fetch users: $error"));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Home", style: FonTextStyle.black20TextStyle()),
              const Divider(),
              SizedBox(height: 20.h),
              Container(
                height: 200.h,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: ColorHelper.kBlack12,
                    //  image: DecorationImage(image: AssetImage("")),
                    borderRadius: BorderRadius.all(Radius.circular(6.r))),

              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconGestureDetector("Business", () {
                    //  Get.to(const BusinessBar());
                  }),
                  SizedBox(width: 10.w),
                  iconGestureDetector("Club", () {}),
                  SizedBox(width: 10.w),
                  iconGestureDetector("Groups", () {}),
                ],
              ),
              SizedBox(height: 20.h),
              commonButton("Submit", ColorHelper.kBlack12, () {
                Get.to(const ProfileBar());
              }),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector iconGestureDetector(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: 100.w,
        decoration: BoxDecoration(
            color: ColorHelper.kBlueGrey,
            borderRadius: BorderRadius.all(Radius.circular(6.r))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: FonTextStyle.field14TextStyle()),
          ],
        ),
      ),
    );
  }
// leadingPopup(context) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         contentPadding: EdgeInsets.all(10.sp),
//         content: Container(
//           decoration: BoxDecoration(color: Colors.transparent),
//           height: 350.0.h,
//           width: 350.0.w,
//           child: Column(
//             children: [
//               Text("Name : ${box.read("name")}"), SizedBox(height: 10.h),
//               //   Text("Email : ${box.read("emial")}"),
//               Text("Phone No: ${box.read("phone")}"), SizedBox(height: 10.h),
//               Text("Biasness: ${Get.arguments}"), SizedBox(height: 10.h),
//               Text("Referral :  ${box.read("referral")}"),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
}
// SingleChildScrollView(
//   child: Column(
//     children: [
//       const SizedBox(height: 60),
//       Center(
//         child: FutureBuilder(
//           future: users!.get(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               var data = snapshot.data;
//               TextEditingController firstNamecontroller =
//                   TextEditingController(text: data!['FirstName']);
//               TextEditingController lastNamecontroller =
//                   TextEditingController(text: data!['LastName']);
//               TextEditingController emailcontroller =
//                   TextEditingController(text: data!['Email']);
//               TextEditingController passwcontroller =
//                   TextEditingController(text: data!['password']);
//               return Column(
//                 children: [
//                   // Container(
//                   //     height: 100,
//                   //     width: 100,
//                   //     decoration: BoxDecoration(
//                   //         borderRadius: BorderRadius.circular(20),
//                   //         color: Colors.grey),
//                   //     child: Image.network('${data['imagess']}')),
//                   Text('${data['FirstName']}'),
//                   Text('${data['LastName']}'),
//                   Text('${data['Email']}'),
//                   Text('${data['password']}'),
//                   // ElevatedButton(
//                   //   onPressed: () {
//                   //     showDialog(
//                   //       context: context,
//                   //       builder: (context) => Dialog(
//                   //         child: Container(
//                   //           height: 350,
//                   //           color: Colors.white,
//                   //           child: Column(
//                   //             children: [
//                   //               const SizedBox(height: 20),
//                   //               TextField(
//                   //                 controller: firstNamecontroller,
//                   //                 decoration: const InputDecoration(
//                   //                     labelText: "Firstname",
//                   //                     enabledBorder: OutlineInputBorder(
//                   //                         borderSide: BorderSide.none),
//                   //                     focusedBorder: OutlineInputBorder(
//                   //                         borderSide: BorderSide.none)),
//                   //               ),
//                   //               const SizedBox(height: 15),
//                   //               TextField(
//                   //                 controller: lastNamecontroller,
//                   //                 decoration: const InputDecoration(
//                   //                     labelText: "Lastname",
//                   //                     enabledBorder: OutlineInputBorder(
//                   //                         borderSide: BorderSide.none),
//                   //                     focusedBorder: OutlineInputBorder(
//                   //                         borderSide: BorderSide(
//                   //                             color: Colors.black))),
//                   //               ),
//                   //               const SizedBox(height: 15),
//                   //               ElevatedButton(
//                   //                 child: const Text('update'),
//                   //                 onPressed: () {
//                   //                   login?.update({
//                   //                     'FirstName':
//                   //                     firstNamecontroller.text,
//                   //                     'LastName':
//                   //                     lastNamecontroller.text,
//                   //                   });
//                   //                 },
//                   //               )
//                   //             ],
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     );
//                   //   },
//                   //   child: const Text('Edit'),
//                   // ),
//                 ],
//               );
//             } else {
//               return const CircularProgressIndicator();
//             }
//           },
//         ),
//       ),
//       const SizedBox(height: 20),
//       // Row(
//       //   mainAxisAlignment: MainAxisAlignment.center,
//       //   children: [
//       //     const Icon(Icons.logout),
//       //     TextButton(
//       //       onPressed: () async {
//       //         await googleSignIn.signOut();
//       //         await box.erase();
//       //         Get.to(const LoginScreen());
//       //
//       //       },
//       //       child: const Text(
//       //         'LOGOUT',
//       //         style: TextStyle(
//       //             color: Colors.red,
//       //             fontWeight: FontWeight.bold,
//       //             fontSize: 15),
//       //       ),
//       //     ),
//       //   ],
//       // ),
//     ],
//   ),
// ),
