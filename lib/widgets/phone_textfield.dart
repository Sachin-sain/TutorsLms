import 'package:flutter/material.dart';
import 'package:tutor_lms/widgets/spacing.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';

import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';
import '../presentation/validate/validators.dart';


class PhoneNumberTextField extends StatelessWidget {
  final String? hintText;
  final String? phoneNumber;
  final String title;
  final TextEditingController? phoneController;

   const PhoneNumberTextField(
      {Key? key, this.hintText, this.phoneNumber, required this.title, this.phoneController})
      : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: Dimensions.h_15),
          padding: EdgeInsets.only(
              top: Dimensions.h_10, bottom: Dimensions.h_15),
          width: Dimensions.h_75,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            color: Theme.of(context).cardColor,
            border: Border.all(
              color: Theme.of(context).shadowColor.withOpacity(0.3)
            )
          ),
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  margin: EdgeInsets.only(left: Dimensions.h_5),
                  height: 20,
                  width: 20,
                  decoration: const BoxDecoration(color: AppColor.transparent),
                ),
                TutorLmsTextWidget(
                  title: phoneNumber ?? '',
                  style:
                      AppTextStyle.bodyMediumTextStyle(color: Theme.of(context).highlightColor),
                ),
                const Icon(Icons.arrow_drop_down,color: AppColor.neutral_400,),
              ],
            ),
          ),
        ),
        HorizontalSpacing(width: Dimensions.h_10),
        Expanded(
          child: SizedBox(
            height: Dimensions.h_60,
            child: TextFormField(
              style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor),
              validator: Validator.phoneNumberValidate,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: phoneController,
              decoration: InputDecoration(
                fillColor: Theme.of(context).cardColor,
                filled: true,
                counterText: ' ',
                contentPadding: const EdgeInsets.all(20),
                  enabledBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
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
                    borderSide:  BorderSide(color: Theme.of(context).shadowColor.withOpacity(0.3)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  hintText: hintText,
                  hintStyle: AppTextStyle.normalTextStyle(
                      FontSize.sp_16, Theme.of(context).shadowColor.withOpacity(0.3))),
            ),
          ),
        )
      ],
    );
  }
}
