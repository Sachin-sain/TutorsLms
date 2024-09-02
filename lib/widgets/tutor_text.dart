import 'package:flutter/material.dart';

class TutorLmsTextWidget extends StatelessWidget {
  final String title;
  final TextStyle style;
  final TextAlign textAlign;
  final TextOverflow textOverflow;
  final int? maxLines;
  final bool? softWrap;

  const TutorLmsTextWidget(
      {Key? key,
      required this.title,
      required this.style,
      this.textAlign = TextAlign.start,
      this.textOverflow = TextOverflow.fade,
      this.maxLines,
      this.softWrap = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: style,
      textAlign: textAlign,
      overflow: textOverflow,
      maxLines: maxLines,
      softWrap: softWrap,
    );
  }
}
