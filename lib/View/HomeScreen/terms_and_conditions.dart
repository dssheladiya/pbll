import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pbl/Model/Constant/color_helper.dart';
import 'package:pbl/Model/Constant/text_style.dart';
import 'package:pbl/Model/Widgets/common_button.dart';
import 'package:pbl/View/HomeScreen/kyc.dart';

class TermsScreen extends StatefulWidget {
  const TermsScreen({super.key});

  @override
  State<TermsScreen> createState() => _TermsScreenState();
}

class _TermsScreenState extends State<TermsScreen> {
  /// bool isSelected = false;
  final List<Data> _data = [
    Data(title: "Agreement ", isSelected: false),
    Data(title: "Agreement ", isSelected: false),
    Data(title: "Execution of the work ", isSelected: false),
    Data(title: "Schedule ", isSelected: false),
    Data(title: "Taxes fees and penalties ", isSelected: false),
    Data(title: "Warranties ", isSelected: false),
    Data(title: "Supervision ", isSelected: false),
    Data(title: "Safety ", isSelected: false),
    Data(title: "MEETINGS ", isSelected: false),
    Data(title: "INSPECTION ", isSelected: false),
    Data(title: "COORDINATION AND ACCESS ", isSelected: false),
    Data(title: "Owner policies ", isSelected: false),
  ];
  CollectionReference pbl = FirebaseFirestore.instance.collection('users');
  FirebaseFirestore db = FirebaseFirestore.instance;
  var checkData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Text("Terms & Conditions ",
                  style: FonTextStyle.black20TextStyle()),
              const Divider(),
              SizedBox(height: 15.h),
              Expanded(
                child: ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: Checkbox(
                              value: _data[index].isSelected,
                              onChanged: (val) {
                                setState(() {
                                  checkData = _data[index].isSelected = val!;
                                  checkData = val!;
                                });
                              }),
                          title: Text(_data[index].title.toString(),
                              style: FonTextStyle.field14300TextStyle()),
                        ),
                      ],
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              commonButton("Submit", ColorHelper.kBlack12, () {
                // final city = {
                //   "Conditions": checkData,
                // };
                // db
                //     .collection("users")
                //     .doc()
                //     .set(city)
                //     .onError((e, _) => log("Error writing document: $e"));
                Get.to(const KycScreen());
              }),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}

class Data {
  final String title;
  bool isSelected;

  Data({
    required this.isSelected,
    required this.title,
  });
}
