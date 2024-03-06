import 'package:flutter/material.dart';
import 'package:pbl/Model/Constant/color_helper.dart';

class ReportBar extends StatefulWidget {
  const ReportBar({super.key});

  @override
  State<ReportBar> createState() => _ReportBarState();
}

class _ReportBarState extends State<ReportBar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorHelper.kWhite,
      body: Column(
        children: [
          Center(child: Text("Report")),
        ],
      ),
    );
  }
}
