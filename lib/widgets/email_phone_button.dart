import 'package:flutter/material.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';

import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';


class EmailPhoneButton extends StatelessWidget {
  const EmailPhoneButton({Key? key,required this.title, required this.isSelected, this.onTap}) : super(key: key);
   final String title;
   final bool isSelected;
  final void Function()? onTap;
@override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TutorLmsConatiner(
            padding: EdgeInsets.only(bottom: Dimensions.h_5),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: isSelected ?  AppColor.appColor : AppColor.transparent,
                  width: 2
                )
              )

            ),
            child: TutorLmsTextWidget(
                title: title,
                style: AppTextStyle.themeBoldTextStyle(
                    fontSize: FontSize.sp_16,
                color: isSelected ? AppColor.appColor : Theme.of(context).shadowColor)),
          ),
        ],
      ),
    );
  }
}
