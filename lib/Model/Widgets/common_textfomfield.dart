import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pbl/Model/Constant/text_style.dart';

class CommonTextFomField extends StatefulWidget {
  const CommonTextFomField(
      {Key? key,
      required this.controller,
      this.textInputAction,
      this.keyboardType,
      this.labelText,
      this.suffixIcon,
      this.prefixIcon,
      this.obscureText,
      this.validator})
      : super(key: key);

  final labelText;
  final suffixIcon;
  final prefixIcon;
  final obscureText;
  final controller;
  final validator;
  final keyboardType;
  final textInputAction;

  @override
  State<CommonTextFomField> createState() => _CommonTextFomFieldState();
}

class _CommonTextFomFieldState extends State<CommonTextFomField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textInputAction: TextInputAction.next,
      keyboardType: widget.keyboardType,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      //style: FonTextStyle.fieldTextStyle(),
      decoration: InputDecoration(
        constraints: BoxConstraints(maxWidth: double.infinity, maxHeight: 56.h),
        labelText: widget.labelText,
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,

        filled: true,
        fillColor: Color(0xffF7F7F7),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE0E0E0)),
            borderRadius: BorderRadius.circular(6.r)),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xffE0E0E0)),
            borderRadius: BorderRadius.circular(6.r)),
        // border: const OutlineInputBorder(
        //   borderRadius: BorderRadius.all(
        //     Radius.circular(10),
        //   ),
        // ),
      ),
    );
  }
}
