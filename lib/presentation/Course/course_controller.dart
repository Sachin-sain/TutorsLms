import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/course_repository_imp.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/membership_repository_imp.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/enroll_course_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/singleCourseResponse.dart';
import 'package:tutor_lms/widgets/player/pod_player.dart';
import 'package:tutor_lms/widgets/tutor_lms_toast.dart';

class CourseController extends GetxController {
  bool loading = false;
  final CourseRepositoryImpl repositoryImpl = CourseRepositoryImpl();
  final MemberRepositoryImpl memberRepositoryImpl = MemberRepositoryImpl();
  Course? course;
  String? videoUrl;
  DateTime? date ;
  String? formatDate;
  bool buttonLoading = false;
  bool hideEnroll = false;
  bool firstTime = true;
  PodPlayerController? videoController;

  onCourse(BuildContext context,String slug) async {
    loading = true;
    var data = await repositoryImpl.singleCourse(slug);
    data.fold((l) {
      if (l is ServerFailure) {
        loading = false;
      }
    }, (r)  {
    course = r.course;
     videoUrl = r.course?.videos?[0].video;
    print("===================================================================$videoUrl");
    date =  DateTime.parse(r.course?.createdAt.toString() ?? '');
    formatDate = "${date?.year}-${date?.month.toString().padLeft(2, '0')}-${date?.day.toString().padLeft(2, '0')}";
    update([ControllerBuilders.courseController]);
    loading = false;
    });
    update([ControllerBuilders.courseController]);
  }

  get(BuildContext context,int id,String slug) async {
    await onCourse(context, slug);
    (LocalStorage.getBool(GetXStorageConstants.userLogin) == true ||LocalStorage.getBool(GetXStorageConstants.jwtExpired) == true ) ? null : checkEnrolled(context, id);
    videoController = PodPlayerController(
        playVideoFrom: PlayVideoFrom.vimeo(videoUrl.toString()),
        podPlayerConfig: const PodPlayerConfig(
          autoPlay: true,
          isLooping: false,
          videoQualityPriority: [1080,720, 360],
        )
    )..initialise();
    update([ControllerBuilders.courseController]);
  }

  getVideo(String video) {
    loading = true;
    videoUrl = video;
    loading = false;
    update([ControllerBuilders.courseController]);
  }

  video(BuildContext context,int courseId,int video) async {
    loading = true;
    update([ControllerBuilders.courseController]);
    var data = await repositoryImpl.getVideo(video,courseId);
    data.fold((l) {
      if (l is ServerFailure) {
        loading = false;
        update([ControllerBuilders.courseController]);
      }
    }, (r) {
      loading = false;
      videoUrl = r.video?.video ?? '';
      firstTime = false;
      videoController?.dispose();
      videoController = PodPlayerController(
          playVideoFrom: PlayVideoFrom.vimeo(videoUrl.toString()),
          podPlayerConfig: const PodPlayerConfig(
            autoPlay: true,
            isLooping: false,
            videoQualityPriority: [1080,720, 360],
          )
      )..initialise();
      update([ControllerBuilders.courseController]);
    });
    update([ControllerBuilders.courseController]);
  }


  onEnroll(BuildContext context,int courseId) async {
    buttonLoading = true;
    update([ControllerBuilders.courseController]);
    var req = EnrollRequest(courseId: courseId);
    var data = await memberRepositoryImpl.enroll(req);
    data.fold((l) {
      if (l is ServerFailure) {
        buttonLoading = false;
        update([ControllerBuilders.courseController]);
      }
    }, (r) {
      ToastUtils.showCustomToast(context, r.message ?? '', true);
      buttonLoading = false;
      hideEnroll = true;
      update([ControllerBuilders.courseController]);
    });
    update([ControllerBuilders.courseController]);
  }

  checkEnrolled(BuildContext context,int id) async {
    loading = true;
    update([ControllerBuilders.courseController]);
    var data = await repositoryImpl.enrolledCourse(id);
    data.fold((l) {
      if (l is ServerFailure) {
        loading = false;
        update([ControllerBuilders.courseController]);
      }
    }, (r) {
      loading = false;
      hideEnroll = r.plan?.enroll == 1 ? true : false;
      update([ControllerBuilders.courseController]);
    });
    update([ControllerBuilders.courseController]);
  }


  onShareButton(String title) async {
    await Share.share(
        'Share to your friends\n\n https://tutorslms.com//course/$title/');
    update([ControllerBuilders.courseController]);
  }
}