import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:remit_app/api_calls/app_info_api.dart';

import '../models/why_choseus_info_model.dart';



class AppInfoProvider extends ChangeNotifier {
  late WhyChoseusInfoModel aboutInfoModel;

  // late WhoWeareModel weareModel;
  List<WhyChooseUsContent> whyChoseUsList=[];
  String baseImgUrl='';


  Future<WhyChoseusInfoModel> getAboutUsPageInfo() async{
    // getServiceList.clear();

    await AppInfoApi.getAllWebInfo().then((value) {

      if(value!=null)
        {
        baseImgUrl=value['img_url'];
        aboutInfoModel=WhyChoseusInfoModel.fromJson(value['why-choose-us']);
        whyChoseUsList.addAll(aboutInfoModel!.whychooseuscontent!);
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