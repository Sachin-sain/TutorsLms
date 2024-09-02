import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:tutor_lms/presentation/dashboard/dashboard.dart';
import 'package:tutor_lms/widgets/common_appbar.dart';
import 'package:tutor_lms/widgets/tutor_lms_container.dart';
import 'package:tutor_lms/widgets/tutor_text.dart';
import '../../constants/apptextstyle.dart';
import '../../constants/fontsize.dart';
import '../../widgets/spacing.dart';
import 'package:http/http.dart' as http;
import '../constants/images.dart';
import '../data.datasource/remote/models/response/frequent_response.dart';
import '../data.datasource/remote/services/apis.dart';

class frequent extends StatefulWidget {
  const frequent({super.key});
  @override
  State<frequent> createState() => _frequentState();
}
class _frequentState extends State<frequent> {
  bool _isExpanded = false;
  List<FrequentReponse> frequent =[];
  List<ListElement> element = [];
  List<FrequentReponse> notificationData =[];
  @override
  void initState() {
    frequentApi();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return TutorLmsConatiner(
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor
      ),
          child: SafeArea(
            child: Scaffold(
              appBar: PreferredSize(preferredSize: Size.fromHeight(Dimensions.h_50),
                  child:  TutorLmsAppbar(title: 'Frequently Asked Questions',onTap: ()=> Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> DashBoard(index: 3))))),
                body: Padding(
                  padding:  EdgeInsets.only(left: Dimensions.w_10,right: Dimensions.w_10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        VerticalSpacing(height: Dimensions.h_30),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: element.length,
                          itemBuilder: (context, index) {
                            if(element.isEmpty ){
                              return Center(
                                child: TutorLmsTextWidget(
                                  title: 'No data found', style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).highlightColor),
                                ) );
                            }
                            else{
                              return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  ExpansionTile(
                                    collapsedIconColor: Theme.of(context).highlightColor,
                                    iconColor: Theme.of(context).highlightColor,
                                    title: TutorLmsTextWidget(
                                      title:  '${element[index].heading}',
                                      style: AppTextStyle.themeBoldTextStyle(color: Theme.of(context).highlightColor,fontSize: FontSize.sp_14)
                                    ),
                                    initiallyExpanded: _isExpanded,
                                    onExpansionChanged: (bool expanding) {
                                      setState(() {
                                        _isExpanded = expanding ;
                                      });
                                    },
                                    children: <Widget>[
                                      ListTile(
                                        title: TutorLmsTextWidget(
                                          softWrap: true,
                                          maxLines: 10,
                                          title: '${element[index].content}',
                                          style: AppTextStyle.normalTextStyle(FontSize.sp_16, Theme.of(context).shadowColor),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              );
                            }
                          },
                        ),

                      ],
                    ),
                  ),
                )
            ),
          )
    );
  }
 frequentApi()async{
    try{
      final response= await http.get(Uri.parse(Apis.faq),);
      var data = jsonDecode(response.body.toString());
      print(data);
      if(response.statusCode==200){
        var k = FrequentReponse.fromJson(data);
        setState(() {
          element.addAll(k.list ?? []);
        });
        return element;
      }
      else {
        return notificationData;
      }
    } catch(e) {
      print(e.toString());
    }
    throw Exception('unable');

  }

}
