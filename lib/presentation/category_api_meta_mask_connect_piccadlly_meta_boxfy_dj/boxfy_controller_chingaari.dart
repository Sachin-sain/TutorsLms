import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/course_repository_imp.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/single_category_response.dart';
import 'package:tutor_lms/widgets/tutor_lms_toast.dart';

class ChikaController extends GetxController {
  bool meow = false;
  List<CourseCategory> categoryList = [];
  final CourseRepositoryImpl dataLekeAnneWaali = CourseRepositoryImpl();

  getFarziData(BuildContext context,String slug) async {
    meow = true ;
     var data = await dataLekeAnneWaali.getCategory(slug);

     data.fold((l) {
       if(l is ServerFailure) {
         meow = false;
         ToastUtils.showCustomToast(context, l.message, false);
         update([ControllerBuilders.stakingController]);
       }
     }, (r)  {
        categoryList.clear();
        categoryList.addAll(r.courses ?? []);
        meow = false;
        update([ControllerBuilders.stakingController]);
     });
    update([ControllerBuilders.stakingController]);
  }
}