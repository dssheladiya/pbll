import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';

class ProfileBar extends StatefulWidget {
  const ProfileBar({super.key});

  @override
  State<ProfileBar> createState() => _ProfileBarState();
}

class _ProfileBarState extends State<ProfileBar> {
  // FirebaseStorage storage = FirebaseStorage.instance;
  // ImagePicker picker = ImagePicker();
  // File? image;
  // String? url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: ColorHelper.kWhite,
      drawer: Drawer(
        shape: const OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.transparent),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: ColorHelper.kBlack12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(height: 48.h, color: Colors.white24),
                  SizedBox(height: 10.h),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 25.r,
                        child: const Icon(
                          Icons.account_circle_outlined,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Denish"),
                          Text("Biasness name"),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            buildListTile("Profile", () {
              setState(() {});
              //  currentIndex == 2 ? Navigator.pop(context) : SizedBox();
            }, Icons.account_circle_outlined),
            buildListTile("Membership fee", () {
              Navigator.pop(context);
            }, Icons.currency_rupee_outlined),
            buildListTile("Attendance", () {}, Icons.date_range_sharp),
            Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
            buildListTile("New Members", () {}, Icons.account_box_outlined),
            buildListTile("GPBO Report", () {}, Icons.checklist_rtl),
            buildListTile("Blood Request", () {}, Icons.bloodtype_outlined),
            Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
            buildListTile(
                "All Winner", () {}, Icons.accessibility_new_outlined),
            buildListTile("GGF", () {}, Icons.message_outlined),
            Divider(color: ColorHelper.kBlack12, endIndent: 20.w, indent: 20.w),
            buildListTile("Setting", () {
              Get.to(const ProfileBar());
            }, Icons.settings),
            buildListTile("Logout", () {
              Get.to(const ProfileBar());
            }, Icons.login_outlined),
          ],
        ),
      ),


      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Business Cat", style: FonTextStyle.black20TextStyle()),
              const Divider(),
              SizedBox(height: 20.h),
              Container(
                width: double.infinity,
                height: 170.h,
                color: Colors.deepPurple,
                // child: Image.asset(""),
              ),
              SizedBox(height: 10.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Name", style: FonTextStyle.black15400TextStyle()),
                      Text("Bisiness Name",
                          style: FonTextStyle.field14300TextStyle()),
                      Text("Phone no",
                          style: FonTextStyle.field14300TextStyle()),
                      Text("Email", style: FonTextStyle.field14300TextStyle()),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    height: 100.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.all(Radius.circular(6.r))),
                    // Center(
                    //   child: InkResponse(
                    //     onTap: () async {
                    //       XFile? file = await picker.pickImage(
                    //           source: ImageSource.gallery, imageQuality: 10);
                    //       image = File(file!.path);
                    //       setState(() {});
                    //     },
                    //     child: Container(
                    //       height: 80,
                    //       width: 80,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20), color: Colors.grey),
                    //       child: image == null
                    //           ? const Center(child: Icon(Icons.image))
                    //           : Image.file(image!, fit: BoxFit.cover),
                    //     ),
                    //   ),
                    // ),
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              buildGestureDetector("Feed", () {}),
              SizedBox(height: 10.h),
              buildGestureDetector("About", () {}),
              SizedBox(height: 10.h),
              buildGestureDetector("Testimonial", () {}),
              SizedBox(height: 15.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconGestureDetector("Call", () {}, Icons.call),
                  SizedBox(width: 10.w),
                  iconGestureDetector("Email", () {}, Icons.email_outlined),
                ],
              ),
              SizedBox(height: 10.h),
              Center(
                child: SizedBox(
                  width: 50.w,
                  height: 50.h,
                  child: Image.asset("assets/images/whatsapp-icon.png"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ListTile buildListTile(String title, Function()? onTap, IconData? icon) {
    return ListTile(
      leading: Icon(icon, size: 28.sp),
      title: Text(title, style: FonTextStyle.field14300TextStyle()),
      trailing: const Icon(Icons.arrow_forward_ios_outlined),
      onTap: onTap,
    );
  }

  GestureDetector iconGestureDetector(String title, Function()? onTap,
      IconData? icon) {
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
            Icon(icon, color: ColorHelper.kWhite70),
            SizedBox(width: 7.w),
            Text(title, style: FonTextStyle.field14TextStyle()),
          ],
        ),
      ),
    );
  }

  GestureDetector buildGestureDetector(String title, Function()? onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40.h,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorHelper.kBlack26,
          borderRadius: BorderRadius.all(Radius.circular(6.r)),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.h),
          child: Row(
            children: [
              Text(title, style: FonTextStyle.black15400TextStyle()),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios_outlined),
            ],
          ),
        ),
      ),
    );
  }
}
