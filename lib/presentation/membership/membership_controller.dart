import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/core/error/failures.dart';
import 'package:tutor_lms/data.datasource/Repository_imp/membership_repository_imp.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/create_payment.dart';
import 'package:tutor_lms/data.datasource/remote/models/request/promo_code_request.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/create_payment_response.dart';
import 'package:tutor_lms/data.datasource/remote/models/response/membershipPlans_response.dart';
import 'package:tutor_lms/widgets/tutor_lms_toast.dart';
import 'package:url_launcher/url_launcher.dart';

class MemberShipController extends GetxController {
  bool loading = false;
  bool buttonLoading = false;
  bool active = false;
  Plans? plans;
  bool month = true;
  bool annual = false;
  String? name;
  String? description;
  String? type;
  String? price;
  String? planId;
  PaymentData? paymentData;
  TextEditingController promoCode = TextEditingController();



  bool month1 = true;
  bool annual1 = false;
  String? name1;
  String? description1;
  String? type1;
  String? price1;

  final MemberRepositoryImpl repositoryImpl = MemberRepositoryImpl();

  @override
  void onInit() {
    print("mewow");
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }




  urlLaunch(String data) async {
    final url = Uri.parse(data);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.platformDefault);
    } else {
      throw 'Could not launch $url';
    }
  }

  // onPayment(BuildContext context) async {
  //   buttonLoading = true;
  //   update([ControllerBuilders.memberShipController]);
  //   var request = StripeRequest(
  //       packageId: planId ?? ''
  //   );
  //   var data = await repositoryImpl.create(request);
  //   data.fold((l) {
  //     if (l is ServerFailure) {
  //       ToastUtils.showCustomToast(context, l.message ?? '', false);
  //       buttonLoading = false;
  //       update([ControllerBuilders.memberShipController]);
  //     }
  //   }, (r) {
  //     if (r.type == "redirect") {
  //       urlLaunch(r.url ?? '');
  //     }
  //     buttonLoading = false;
  //     update([ControllerBuilders.memberShipController]);
  //   }
  //   );
  //   update([ControllerBuilders.memberShipController]);
  // }



  Future<void> initPaymentSheet(BuildContext context) async {
    try {
      var response = await Stripe.instance.initPaymentSheet(
          paymentSheetParameters: SetupPaymentSheetParameters(
            customFlow: true,
            paymentIntentClientSecret: paymentData?.clientSecret,
            merchantDisplayName: 'meow',
          ));
      if(response != null) {
        print(response.toString());
        displayPaymentSheet(context);
      }
    } catch (e) {
      print("yaha pr ------" + e.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
      rethrow;
    }
  }

applyPromoCode(BuildContext context) async {
  buttonLoading = true;
  update([ControllerBuilders.memberShipController]);
  var request = PromoCodeRequest(
      promoCode: promoCode.text
  );
  var data = await repositoryImpl.promoCode(request);
  data.fold((l) {
    if (l is ServerFailure) {
      ToastUtils.showCustomToast(context, l.message, false);
      buttonLoading = false;
      update([ControllerBuilders.memberShipController]);
    }
  }, (r) {
    ToastUtils.showCustomToast(context, r.message ?? '', true);
    update([ControllerBuilders.memberShipController]);
    buttonLoading = false;
    Navigator.pop(context);
    update([ControllerBuilders.memberShipController]);
  }
  );
  update([ControllerBuilders.memberShipController]);
}


  checkPayment(String payment) async {
    var request = CheckPaymentRequest(
        paymentIntent: payment,
        country: paymentData?.country ?? ''
    );
    var data = await repositoryImpl.checkPayment(request);
    data.fold((l) {
      if (l is ServerFailure) {
        buttonLoading = false;
        update([ControllerBuilders.memberShipController]);
      }
    }, (r) {
        update([ControllerBuilders.memberShipController]);

      buttonLoading = false;
      update([ControllerBuilders.memberShipController]);
    }
    );
    update([ControllerBuilders.memberShipController]);
  }

  createPayment(String planid) async {
    buttonLoading = true;
    update([ControllerBuilders.memberShipController]);
    var request = CreatePaymentRequest(
        id: planid ?? ''
    );
    var data = await repositoryImpl.createPayment(request);
    data.fold((l) {
      if (l is ServerFailure) {
        buttonLoading = false;
        update([ControllerBuilders.memberShipController]);
      }
    }, (r) {
       paymentData = r.data;
        update([ControllerBuilders.memberShipController]);

      buttonLoading = false;
      update([ControllerBuilders.memberShipController]);
    }
    );
    update([ControllerBuilders.memberShipController]);
  }


  displayPaymentSheet(BuildContext context) async {
    try {
      await Stripe.instance.presentPaymentSheet().then(( PaymentSheetPaymentOption? value) {
        print(value);
        showDialog(
            context: context,
            builder: (_) =>
                const AlertDialog(
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.green,
                        size: 100.0,
                      ),
                      SizedBox(height: 10.0),
                      Text("Payment Successful!"),
                    ],
                  ),
                ));

      }).onError((error, stackTrace) {
        print(error.toString());
        throw Exception(error);
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      const AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Icon(
                  Icons.cancel,
                  color: Colors.red,
                ),
                Text("Payment Failed"),
              ],
            ),
          ],
        ),
      );
    } catch (e) {
      print('$e');
    }
  }
}


