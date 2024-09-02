import 'package:flutter/material.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';

class TutorLmsAppbar extends StatelessWidget {
  final double? height;
  final String? title;
  final Color? color;
  final bool hideBack;
  final void Function()? onTap;
  const TutorLmsAppbar({super.key, this.height,this.title,this.onTap,this.color,this.hideBack = false});

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(height ?? Dimensions.h_50),
      child: TutorLmsConatiner(
        width: double.infinity,
        padding: EdgeInsets.only(top: Dimensions.h_10,bottom: Dimensions.h_10),
        decoration: BoxDecoration(
            color: color ?? Theme.of(context).scaffoldBackgroundColor
        ),
        child: Center(
          child: Row(
            children: [
              hideBack? const SizedBox.shrink(): Padding(
                padding:  EdgeInsets.only(left: Dimensions.w_10),
                child: GestureDetector(
                  onTap: onTap,
                  child: Icon(Icons.arrow_back,color: Theme.of(context).shadowColor),
                ),
              ),
              hideBack ? HorizontalSpacing(width: Dimensions.w_10) : HorizontalSpacing(width: Dimensions.w_10),
              TutorLmsTextWidget(title: title ?? '', style: AppTextStyle.themeBoldNormalTextStyle(
                  color: Theme.of(context).highlightColor,
                  fontSize: FontSize.sp_20
              ))
            ],
          ),
        ),
      ),
    );
  }
}
