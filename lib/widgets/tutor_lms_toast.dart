import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/appcolor.dart';
import '../constants/apptextstyle.dart';
import '../constants/fontsize.dart';


class ToastUtils {
  static Timer? toastTimer;
  static OverlayEntry? _overlayEntry;
  static void showCustomToast(
      BuildContext context, String message, bool isSuccess) {
    if (toastTimer == null || !(toastTimer?.isActive ?? false)) {
      _overlayEntry = createOverlayEntry(context, message, isSuccess);
      Overlay.of(context).insert(_overlayEntry!);
      toastTimer = Timer(const Duration(seconds: 2), () {
        if (_overlayEntry != null) {
          _overlayEntry?.remove();
        }
      });
    }
  }

  static OverlayEntry createOverlayEntry(
      BuildContext context, String message, bool isSuccess) {
    return OverlayEntry(
      builder: (context) => Positioned(
        top: Dimensions.h_80,
        right: Dimensions.w_25,
        left: Dimensions.w_25,
        child: Material(
          elevation: 1.0,
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(4),
          child: Container(
            width: MediaQuery.of(context).size.width - Dimensions.w_50,
            padding: EdgeInsets.only(
                left: Dimensions.w_10,
                right: Dimensions.w_10,
                top: Dimensions.h_15,
                bottom: Dimensions.h_15),
            decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(15)),
            child: Align(
              alignment: Alignment.center,
              child: Row(
                children: <Widget>[
                  Visibility(
                    visible: isSuccess,
                    child:  Icon(
                      isSuccess ? CupertinoIcons.checkmark_circle_fill : Icons.cancel,
                      color: isSuccess ? Colors.green : AppColor.red,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 12, right: 8),
                    child: SizedBox(
                      width: 210,
                      child: Text(
                        message,
                        maxLines: 3,
                        style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_12,color: isSuccess ? Colors.green : AppColor.red)
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
