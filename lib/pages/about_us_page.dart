import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:remit_app/api_calls/user_api_calls.dart';
import 'package:remit_app/pages/user_profile_page.dart';
import 'package:remit_app/providers/app_provider.dart';

import '../api_calls/app_info_api.dart';
import '../colors.dart';
import '../custom_widgits/drawer.dart';
import '../helper_method/get_user_info.dart';
import '../models/why_choseus_info_model.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  static const String routeName='/about';

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  late AppInfoProvider provider;

  @override
  void didChangeDependencies() {
    provider=Provider.of(context,listen: true);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('About Us'),
        backgroundColor: MyColor.blue,
      ),
      body: ListView(
        children: [
          SizedBox(height: 30,),
          SvgPicture.asset('svg/home.svg',width: 300,height: 220,),


          Container(
            // decoration: BoxDecoration(
            //
            //   gradient: LinearGradient(
            //     begin: Alignment.centerRight,
            //     end: Alignment.centerLeft,
            //     colors: [
            //       Colors.lightBlueAccent,
            //       MyColor.blue,
            //     ],),
            // ),

            child: Column(
              children: [
                SizedBox(height: 40,),
                Align(
                    alignment:Alignment.center,
                    child: Text(provider.aboutInfoModel.whychooseuscontent!.first.content!.name??'Why Chose Us?',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: MyColor.blue),)),
                ...provider.whyChoseUsList.map((e) =>Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Icon(Icons.camera_sharp),
                    ),
                    //Image.network(provider.baseImgUrl+e.content!.contentMedia!.description!.image!,height: 100,width: 100,),
                    Text(e.content!.name!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                    Flexible(child: Html(
                      data: e.description!.shortDescription,style: {
                      'p':Style(textAlign: TextAlign.center),
                    },
                    )),
                  ],)
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Our History',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Flexible(child: Text('''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum, ac aliquet odio mattis. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.'''))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Our Mission',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                Flexible(
                    child: Text('''\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum Lorem ipsum dolor sit amet, consectetur adipiscing elit.''',textAlign: TextAlign.start,)),
                SizedBox(height: 5,),
                Flexible(
                    child: Text('''\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum Lorem ipsum dolor sit amet, consectetur adipiscing elit.''',textAlign: TextAlign.start,)),
                SizedBox(height: 5,),
                Flexible(
                    child: Text('''\u2022 Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et velit interdum Lorem ipsum dolor sit amet, consectetur adipiscing elit.''',textAlign: TextAlign.start,)),

              ],
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 30,),
              Text('Why Choose Us', style: TextStyle(color: MyColor.blue,fontSize: 24,fontWeight: FontWeight.bold),),

              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Save Time',style: TextStyle(fontSize: 18),),
                        Icon(Icons.more_time_outlined,size: 70,color: MyColor.blue,),
                        Text('Instant or one-hour transfers are possible to 40+ countries.24/7 delivery to selected countries (no weekend delays).',textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Save Money',style: TextStyle(fontSize: 18),),
                        Icon(Icons.attach_money,size: 70,color: MyColor.blue,),
                        Text('Your first two transfers are fee-free.Great rates & low fees.Save up to 90% compared to banks and traditional money transfer providers.',textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Save Securely',style: TextStyle(fontSize: 18),),
                        Icon(Icons.add_card,size: 70,color: MyColor.blue,),
                        Text('Regulated by financial institutions in Australia.Anti-fraud and encryption technology.Trusted by more than 1 thousand customers.',textAlign: TextAlign.center,),
                      ],
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}