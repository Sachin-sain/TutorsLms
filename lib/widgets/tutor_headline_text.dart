import 'package:flutter/material.dart';
import '../constants/apptextstyle.dart';

class TradeBitHeadlineTextWidget extends StatelessWidget {
  final String title;
  final TextAlign textAlign;
  final TextStyle? style;

  const TradeBitHeadlineTextWidget(
      {Key? key, required this.title,this.style, this.textAlign = TextAlign.start})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style ?? AppTextStyle.themeBoldTextStyle(),
      textAlign: textAlign,
    );
  }
}