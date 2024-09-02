import 'package:flutter/material.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';

import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';


class TutorLmsTextField extends StatelessWidget {
  const TutorLmsTextField(
      {Key? key,
      required this.hintText,
        this.color,
        this.hintStyle,
        this.validator,
        this.height,
        this.contentPadding,
        this.borderEnable = true,
      required this.title, required this.controller,
      })
      : super(key: key);
  final String hintText;
  final String title;
  final bool borderEnable;
  final double? height;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final Color? color;
  final String? Function(String?)? validator;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      cursorColor: Theme.of(context).shadowColor,
      controller: controller,
      decoration: InputDecoration(
        fillColor: color ?? Theme.of(context).cardColor,
          filled: true,
          counterText: ' ',
        contentPadding: contentPadding ?? const EdgeInsets.only(top: 8,bottom: 8,left: 10,right: 10),
          enabledBorder: OutlineInputBorder(
            borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1, color: AppColor.red),
            borderRadius: BorderRadius.circular(8),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1,color: AppColor.red),
            borderRadius: BorderRadius.circular(8),
          ),
          border: OutlineInputBorder(
            borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
            borderRadius: BorderRadius.circular(8),
          ),
          hintText: hintText,
          hintStyle: hintStyle ?? AppTextStyle.normalTextStyle(FontSize.sp_12, AppColor.neutral_600)),
    );
  }
}


class TradeBitTextFieldLabel extends StatelessWidget {
  const TradeBitTextFieldLabel(
      {Key? key,
        required this.hintText,
        this.color,
        this.hintStyle,
        this.height,
        this.contentPadding,
        this.borderEnable = true,
        this.textColor,
        required this.title, required this.controller,
      })
      : super(key: key);
  final String hintText;
  final String title;
  final bool borderEnable;
  final double? height;
  final TextEditingController controller;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;
  final Color? color;
  final Color? textColor;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding:  EdgeInsets.only(left: Dimensions.w_5),
          child: TutorLmsTextWidget(title: title, style: AppTextStyle.themeBoldNormalTextStyle(
            fontSize: FontSize.sp_14,
            color: textColor ?? Theme.of(context).shadowColor
          )),
        ),
        VerticalSpacing(height: Dimensions.h_10),
        SizedBox(
          height: height ?? Dimensions.h_60,
          child: TextFormField(
            style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),
            cursorColor: Theme.of(context).shadowColor,
            controller: controller,
            decoration: InputDecoration(
                fillColor: color ?? Theme.of(context).cardColor,
                filled: true,
                counterText: ' ',
                contentPadding: contentPadding ?? const EdgeInsets.only(left: 10,right: 10,top: 8,bottom: 8),
                enabledBorder: OutlineInputBorder(
                  borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: AppColor.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1,color: AppColor.red),
                  borderRadius: BorderRadius.circular(8),
                ),
                border: OutlineInputBorder(
                  borderSide:  borderEnable ? BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)) : const BorderSide(color: AppColor.transparent),
                  borderRadius: BorderRadius.circular(8),
                ),
                hintText: hintText,
                hintStyle: hintStyle ?? AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_13, color : Theme.of(context).shadowColor.withOpacity(0.5))),
          ),
        ),
      ],
    );
  }
}