import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/app_info_api.dart';

import '../models/counter_up_models.dart';
import '../models/who_weare_model.dart';
import '../models/why_choseus_info_model.dart';



class AppInfoProvider extends ChangeNotifier {
  late WhyChoseusInfoModel aboutInfoModel;
  late WhoWeareModel whoWeAreInfoModel;
  late CounterUpModels counterUpInfoModel;

  // late WhoWeareModel weareModel;
  List<WhyChooseUsContent> whyChoseUsList=[];
  List<WhoWeAreContent> whoWeAreContentList=[];
  List<CounterUpTemplate> counterUpTemplateList=[];
  String baseImgUrl='';


  Future<WhyChoseusInfoModel> getAboutUsPageInfo() async{
    // getServiceList.clear();

    await AppInfoApi.getAllWebInfo().then((value) {

      if(value!=null)
        {
        baseImgUrl=value['img_url'];
        aboutInfoModel=WhyChoseusInfoModel.fromJson(value['why-choose-us']);
        whoWeAreInfoModel=WhoWeareModel.fromJson(value['who-we-are']);
        counterUpInfoModel=CounterUpModels.fromJson(value['counter-up']);

        //add all why chose us content
        whyChoseUsList.addAll(aboutInfoModel.whychooseuscontent!);
        //add all who we are content
        whoWeAreContentList.addAll(whoWeAreInfoModel.whowearecontent!);
        //add counter up value
        counterUpTemplateList.addAll(counterUpInfoModel.counteruptemplate!);



        // aboutInfoModel.whychooseuscontent!.forEach((element) {
        //   whyChoseUsList.add(element);
        // });
        // for(Map i in aboutInfoModel.whychooseuscontent){
        //   whyChoseUsList.add(WhyChoseUsContent.fromJson(i));
        // }

        // weareModel=WhoWeareModel.fromJson(value['who-we-are']);
       // print(weareModel.whychooseuscontent!.first.content!.name);
          
      }else {
        print('VALUE RETURN HTML');
      }
      //get the final service charge
    });

    print(aboutInfoModel.toJson());


    return aboutInfoModel;
    // print(countryNameList.length);
  }
}