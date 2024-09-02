import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/core/error/exceptions.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/presentation/Auth/login/login.dart';
import '../../constants/constants.dart';
import '../../core/error/failures.dart';
import '../../data.datasource/Repository_imp/auth_repository_imp.dart';
import '../../data.datasource/remote/models/response/UserUpdate.dart';
import '../../data.datasource/remote/models/response/popular_course_response.dart';
import '../../widgets/tutor_lms_toast.dart';

class HomepageController extends GetxController {
  bool loading=false;
  final List<Course> bannerList=[];
  bool search=false;
  List<Course> filterList=[];
  UserDetails? user;
  final AuthRepositoryImpl repositoryImpl = AuthRepositoryImpl();
  TextEditingController searchController = TextEditingController();

  onResetBanner(BuildContext context) async {
    loading = true;
    var data = await repositoryImpl.homePage();
    data.fold((l) {
      if (l is ServerFailure) {
        loading =false;
        update([ControllerBuilders.homeController]);
        ToastUtils.showCustomToast(context, l.message ?? '', false);
      }
    }, (r) {
      loading =false;
      filterList.clear();
      bannerList.clear();
      filterList.addAll(r.courses ?? []);
      bannerList.addAll((r.courses ?? []));
      update([ControllerBuilders.homeController]);
    });
    update([ControllerBuilders.homeController]);
  }



  void filterSearch(String text) {
    filterList = bannerList.where((e) => e.title!.toUpperCase().contains(text.toUpperCase())).toList();
    search = true;
    update([ControllerBuilders.homeController]);

  }

  void clearTextField() {
  search = false;
  searchController.clear();
  update([ControllerBuilders.homeController]);
  }

  onProfile(BuildContext context) async {
    var data = await repositoryImpl.user();
    data.fold((l) {
      if (l is ServerFailure) {
      }
    }, (r) {
      user = r.user;

      update([ControllerBuilders.homeController]);
    });

  }
}