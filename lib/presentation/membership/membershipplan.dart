import 'dart:convert';
import 'dart:developer';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:toast/toast.dart';
import 'package:tutor_lms/constants/appcolor.dart';
import 'package:tutor_lms/constants/constants.dart';
import 'package:tutor_lms/data.datasource/local/local_storage.dart';
import 'package:tutor_lms/data.datasource/remote/services/apis.dart';
import 'package:tutor_lms/presentation/membership/membership_controller.dart';
import 'package:tutor_lms/widgets/common_appbar.dart';
import 'package:tutor_lms/widgets/ozstaff_loader.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../constants/images.dart';
import '../../widgets/spacing.dart';
import '../../widgets/tutorlms_textbutton.dart';
import '../../widgets/tutor_text.dart';
import '../dashboard/dashboard.dart';
import 'package:http/http.dart' as http;

class MemberShip extends StatefulWidget {
  const MemberShip({super.key});

  @override
  State<MemberShip> createState() => _MemberShipState();
}

class _MemberShipState extends State<MemberShip> {
  final MemberShipController memberShipController = Get.put(MemberShipController());
  List _plans = [];
  List planNames = [];
  List<Map<String, int>> selectedPrice = [];
  bool loading = false;
  String? bPrice;
  late Razorpay razorpay;

  @override
  void initState()  {
    memberShip();
    super.initState();
    razorpay =  Razorpay();
    razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, handlerErrorFailure);
    razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, handlerExternalWallet);
  }

  memberShip() async {
    setState(() {
      loading = true;
    });
    try {
      final response = await http.get(Uri.parse(Apis.memberShipPlan), headers: LocalStorage.getBool(GetXStorageConstants.userLogin) == false ? {
         'Authorization' : LocalStorage.getAuthToken()
      } : {});
      var data = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        log(data.toString());
        setState(() {
          Map<String, dynamic> result = data['plans'];
          planNames.clear();
          selectedPrice.clear();
          _plans.clear();
          result.forEach((key, value) {
            planNames.add(key);
            selectedPrice.add({key: 0});
            List v = value;
            v.forEach((element) {
              _plans.add(element);
            });
          });
          loading = false;
        });
      } else {}
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: memberShipController,
      id: ControllerBuilders.memberShipController,
      builder: ( controller) {
        return WillPopScope(
          onWillPop: () async => false,
          child: SafeArea(
            child: Scaffold(
                appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_50), child:
                TutorLmsAppbar(title: 'MemberShip Plan',onTap: ()=> Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context)=> const DashBoard(index: 3))),color: Theme.of(context).scaffoldBackgroundColor,)),
                body: loading ? const Center(
                  child: TutorActivityIndicator(),
                ) :  SingleChildScrollView(
                    child: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: planNames.length,
                        itemBuilder: (c,i) {
                          List currentPlan = _plans.where((element) => element["name"] == planNames[i]).toList();
                          return  Padding(
                            padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_15,top: Dimensions.h_20),
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: Column(
                                children: [
                                  VerticalSpacing(height: Dimensions.h_10),
                                  Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_10,bottom: Dimensions.h_5),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        TutorLmsTextWidget(title: StringUtils.capitalize(planNames[i] ?? '' ), style: AppTextStyle.themeBoldNormalTextStyle(fontSize : FontSize.sp_22, color: Theme.of(context).highlightColor) ),
                                        _getWidgets(currentPlan, i),
                                      ],
                                    ),
                                  ),
                                  VerticalSpacing(height: Dimensions.h_10),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: Dimensions.w_15),
                                        child: TutorLmsTextWidget(title: _plans[i]["description"] ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor)),
                                      )),
                                  VerticalSpacing(height: Dimensions.h_18),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: Dimensions.w_15),
                                        child: TutorLmsTextWidget(title: '\$${currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["price"] ?? ''}',
                                            style: AppTextStyle.themeBoldNormalTextStyle(fontSize: FontSize.sp_26, color :Theme.of(context).highlightColor)),
                                      )),
                                  Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding:  EdgeInsets.only(left: Dimensions.w_15),
                                        child: TutorLmsTextWidget(title: _plans[i]["currency"] ?? '', style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).shadowColor)),
                                      )),
                                  VerticalSpacing(height: Dimensions.h_10),
                                  Divider(
                                    color: Theme.of(context).shadowColor,
                                    height: 20,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  VerticalSpacing(height: Dimensions.h_5),
                                  ListTile(
                                    leading: SizedBox(
                                        height: Dimensions.h_30,
                                        width: Dimensions.h_30,
                                        child: Image.asset(Images.book,scale: 10,)),
                                    title: TutorLmsTextWidget(title: '${currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["total_courses"] == '0' ? "Unlimited" : currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["total_courses"] ?? ''} Courses',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                                    subtitle: TutorLmsTextWidget(title: 'Excel in any ${currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["total_courses"] == '0' ? "Unlimited" : currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["total_courses"]} Courses for you',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor)),
                                  ),
                                  ListTile(
                                    leading: SizedBox(
                                        height: Dimensions.h_30,
                                        width: Dimensions.h_30,
                                        child: Image.asset(Images.support,)),
                                    title: TutorLmsTextWidget(title: '24x7 Support',style: AppTextStyle.normalTextStyle(FontSize.sp_14, Theme.of(context).highlightColor)),
                                    subtitle: TutorLmsTextWidget(title: 'Introducing Our 24/7 Support',style: AppTextStyle.normalTextStyle(FontSize.sp_12, Theme.of(context).shadowColor)),
                                  ),
                                  Divider(
                                    color: Theme.of(context).shadowColor,
                                    height: 20,
                                    indent: 20,
                                    endIndent: 20,
                                  ),
                                  VerticalSpacing(height: Dimensions.h_10),
                                  LocalStorage.getBool(GetXStorageConstants.userLogin) == true ? Padding(
                                    padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_15),
                                    child: TutorLmsTextButton(
                                      height: Dimensions.h_40,
                                      labelName: "Choose plan",
                                      style: AppTextStyle.buttonTextStyle(
                                          color: AppColor.white),
                                      onTap: () {
                                      },
                                      margin: EdgeInsets.zero,
                                      color: AppColor.appColor,
                                    ),
                                  ) : Padding(
                                      padding:  EdgeInsets.only(left: Dimensions.w_15,right: Dimensions.w_15),
                                      child:  TutorLmsTextButton(
                                        loading: controller.buttonLoading,
                                        height: Dimensions.h_40,
                                        labelName: currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"] == 'not_eligible' ? " Not Eligible" : StringUtils.capitalize(currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"]),
                                        style: AppTextStyle.buttonTextStyle(
                                            color:  AppColor.white),
                                        onTap: (currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"] == 'not_eligible' || currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"] == 'active') ? () {} : () async {
                                          await controller.createPayment(currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["id"].toString());
                                          if(controller.paymentData?.paymentIntent != null ) {
                                             if(controller.paymentData?.country == 'IN') {
                                               openCheckout();
                                             }  else {
                                               controller.initPaymentSheet(context);
                                             }
                                          }
                                        },
                                        margin: EdgeInsets.zero,
                                        color: (currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"] == 'not_eligible' || currentPlan[selectedPrice[i]["${planNames[i]}"] ?? 0]["plan_active"] == 'active') ?   Theme.of(context).shadowColor : AppColor.appColor ,
                                      )
                                  ),
                                  VerticalSpacing(height: Dimensions.h_20),
                                ],
                              ),
                            ),
                          );
                        })
                )

            ),
          ),
        );

      },
    );
  }

  Row _getWidgets(List currentPlan, int index) {
    List<Widget> w = [];
    for (int i=0; i<currentPlan.length; i++) {
      w.add(GestureDetector(
        onTap: () {
          setState(() {
            selectedPrice[index][planNames[index]] = i;
            print(index);
          });
        },
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(left: Dimensions.w_10),
          height: Dimensions.h_30,
          width: Dimensions.w_70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: selectedPrice[index][planNames[index]] == i ? AppColor.appColor.withOpacity(0.8) : Theme.of(context).scaffoldBackgroundColor
          ),
          child: TutorLmsTextWidget(title: currentPlan[i]['type'] == 'month' && currentPlan[i]['price'] == '0.00' ? 'OneTime' : currentPlan[i]["type"] == 'year' ? "Annual"  : 'Month' ?? '',style:
          AppTextStyle.themeBoldNormalTextStyle(fontSize: Dimensions.h_13,  color : selectedPrice[index][planNames[index]] == i ? AppColor.white : Theme.of(context).shadowColor)),
        ),
      ));
    }
    return Row(
      children: w,
    );
  }

  void openCheckout(){
    var options = {
      "key" : 'rzp_live_fvL2uzJjfb4PnI',
      "order_id" : memberShipController.paymentData?.paymentIntent,
      "amount" : memberShipController.paymentData?.amount,
      "name" : memberShipController.paymentData?.name,
      "description" : "Payment for the some random product",
      "prefill" : {
        "email" : memberShipController.paymentData?.email
      },

    };
    try{
      razorpay.open(options);

    }catch(e){
      print('errrrrrrrroooooor');
      print(e.toString());
    }

  }
  Future<void> _handlePaymentSuccess(PaymentSuccessResponse response) async {
    print('=================================> ${response.orderId}');
    if(response.orderId != null ) {
      await memberShipController.checkPayment(response.orderId ?? '');
      memberShip();
    }
  }

  void handlerErrorFailure(){
    print("Pament error");
    Toast.show("Pament error");
  }

  void handlerExternalWallet(){
    print("External Wallet");
    Toast.show("External Wallet");
  }

@override
  void dispose() {
    razorpay.clear();
    Get.delete<MemberShipController>();
    super.dispose();
  }
}
