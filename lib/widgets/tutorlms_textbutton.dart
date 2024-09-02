import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tutor_lms/widgets/tradebit_large_text.dart';
import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';

class TutorLmsTextButton extends StatelessWidget {
  final String labelName;
  final EdgeInsets? margin;
  final void Function() onTap;
  final Color? color;
  final TextStyle? style;
  final double? height;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final bool loading;
   const TutorLmsTextButton(
      {Key? key, required this.labelName,this.margin,required this.onTap,this.color,this.style, this.height, this.border, this.borderRadius,  this.loading = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? Dimensions.h_40,
        decoration: BoxDecoration(
          color: color ?? AppColor.appColor,
          borderRadius: borderRadius ?? BorderRadius.circular(8),
          border: border
        ),
        child: Center(
          child: loading == true ? const CupertinoActivityIndicator(
            color: AppColor.white,
          ) : TradeBitLargeTextWidget(
            style:  style ?? AppTextStyle.buttonTextStyle(),
            title: labelName,
          ),
        ),
      ),
    );
  }
}

class TradeBuyTextButton extends StatelessWidget {
  final EdgeInsets? margin;
  void Function() onTap;
  final TextStyle? style;
  final double? height;
  final String? isSelected;
  final bool loading;
  TradeBuyTextButton(
      {Key? key,this.margin,required this.onTap,this.style, this.height,this.isSelected,this.loading = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height ?? Dimensions.h_45,
        decoration: BoxDecoration(
          color:  isSelected == 'Sell'? AppColor.redButton : AppColor.green,
          borderRadius: BorderRadius.circular(4),
        ),
        child: Center(
          child: loading == true ? const CupertinoActivityIndicator(
            color: AppColor.white,
          ) : TradeBitLargeTextWidget(
            style:  style ?? AppTextStyle.buttonTextStyle(),
            title: isSelected == 'Sell'? 'Sell' : 'Buy',
          ),
        ),
      ),
    );
  }
}