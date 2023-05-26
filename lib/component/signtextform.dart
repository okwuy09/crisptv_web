import 'package:crisptv_media/component/color.dart';
import 'package:crisptv_media/component/style.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SignTextForm extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? Function(String?)? validatior;
  final Widget? suffixIcon;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final Function(String)? onChanged;
  final Color? fillColor;
  Color borderColor;
  SignTextForm(
      {Key? key,
      required this.controller,
      this.validatior,
      this.onChanged,
      this.hintText,
      this.suffixIcon,
      this.autofillHints,
      this.fillColor,
      this.borderColor = const Color(0xFF000000),
      required this.obscureText,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: style.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColor.white,
      ),
      obscureText: obscureText,
      autofillHints: autofillHints,
      cursorColor: AppColor.white,
      keyboardType: keyboardType,
      controller: controller,
      onChanged: onChanged,
      validator: validatior,
      decoration: InputDecoration(
        fillColor: fillColor,
        filled: true,
        hintText: hintText,
        hintStyle: style.copyWith(
          color: AppColor.white.withOpacity(0.4),
          fontSize: 14,
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppColor.blue,
          ),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppColor.blue,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(
            color: AppColor.gray,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: BorderSide(color: borderColor),
        ),
        suffixIcon: suffixIcon,
      ),
    );
  }
}
