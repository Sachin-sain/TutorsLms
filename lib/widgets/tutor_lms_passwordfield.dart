import 'package:flutter/material.dart';

import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';
import '../presentation/validate/validators.dart';


class TradeBitPasswordTextField extends StatelessWidget {
  const TradeBitPasswordTextField(
      {Key? key,
      required this.hintText,
      required this.title,
      this.suffixIcon,
        this.onEditingComplete,
      required this.controller,this.obscureText = true})
      : super(key: key);
  final String hintText;
  final String title;
  final Widget? suffixIcon;
  final TextEditingController controller;
  final bool obscureText;
  final void Function()? onEditingComplete;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),
      validator: Validator.passwordValidate,
      cursorColor: AppColor.neutral_500,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      obscureText: obscureText,
      controller: controller,
      onEditingComplete: onEditingComplete,
      decoration: InputDecoration(
        filled: true,
        fillColor: Theme.of(context).cardColor,
        counterText: " ",
        contentPadding: const EdgeInsets.all(10),
          enabledBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: suffixIcon,
          focusedBorder: OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: AppColor.red),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
            borderRadius: BorderRadius.circular(10),
          ),
          hintText: hintText,
          hintStyle:
              AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor)),
    );
  }
}
