import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
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
import 'contact_us_page.dart';

class AboutUsPage extends StatefulWidget {
  const AboutUsPage({Key? key}) : super(key: key);
  static const String routeName='/about';

  @override
  State<AboutUsPage> createState() => _AboutUsPageState();
}

class _AboutUsPageState extends State<AboutUsPage> {

  late AppInfoProvider provider;
  List<CarouselItem> itemList =[
    CarouselItem(
      image: const NetworkImage(
        'https://remit.daneshexchange.com/assets/uploads/content/63d4ae51c74e71674882641.png',
      ),
      // boxDecoration: BoxDecoration(
      //   gradient: LinearGradient(
      //     begin: FractionalOffset.bottomCenter,
      //     end: FractionalOffset.topCenter,
      //     colors: [
      //       Colors.blueAccent.withOpacity(1),
      //       Colors.black.withOpacity(.3),
      //     ],
      //     stops: const [0.0, 1.0],
      //   ),
      // ),
      // title: 'Push your creativity to its limits by reimagining this classic puzzle!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      // leftSubtitle: '\$51,046 in prizes',
      // rightSubtitle: '4882 participants',
      // s
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://remit.daneshexchange.com/assets/uploads/content/63d4ae51c74e71674882641.png',
      ),
      // title: '@coskuncay published flutter_custom_carousel_slider!',
      titleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.white,
      ),
      // leftSubtitle: '11 Feb 2022',
      // rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];

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

          //Who we are
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 20,),
                Align(
                    alignment:Alignment.center,
                    child: Text(provider.whoWeAreInfoModel.whowearetemplate!.first.description!.title??'Who we are..',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),)),
                SizedBox(height: 20,),
                ...provider.whoWeAreInfoModel.whowearetemplate!.map((e) => Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(e.description!.subTitle??'Title',style: TextStyle(fontSize: 16),),
                    Html(
                      data: e.description!.shortDescription??'Testing',
                      style: {
                        'h5': Style(fontSize: FontSize(20)),
                        'p':Style(fontSize: FontSize(16)),
                        'li':Style(fontSize: FontSize(16))
                      },
                    ),
                  ],
                )),
              ],
            ),
          ),

          //Counter
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Countup(
                                  begin: 0,
                                  end: double.parse(provider.counterUpTemplateList.first.description!.firstCounter??'2'),
                                  duration: Duration(seconds: 3),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: MyColor.blue,fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text('M+',style: TextStyle(fontSize: 28,color: MyColor.blue,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Flexible(child: Text(provider.counterUpTemplateList.first.description!.firstContent??'Happy Customer',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: MyColor.grey),)),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Countup(
                                  begin: 0,
                                  end: double.parse(provider.counterUpTemplateList.first.description!.secondCounter??"80",),
                                  duration: Duration(seconds: 3),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: MyColor.blue,fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('+',style: TextStyle(fontSize: 28,color: MyColor.blue,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Flexible(child: Text(provider.counterUpTemplateList.first.description!.secondContent??'Countries with instant or one-hour transfers',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: MyColor.grey),)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Up to',style: TextStyle(fontSize: 28,color: MyColor.blue,fontWeight: FontWeight.bold),),
                                Countup(
                                  begin: 0,
                                  end: double.parse(provider.counterUpTemplateList.first.description!.thirdCounter??'75',),
                                  duration: Duration(seconds: 3),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: MyColor.blue,fontWeight: FontWeight.bold
                                  ),
                                ),

                                Text('%',style: TextStyle(fontSize: 28,color: MyColor.blue,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Flexible(child: Text(provider.counterUpTemplateList.first.description!.thirdContent??'Cheaper than banks and high street providerss',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: MyColor.grey),)),
                          ],
                        ),
                      ),
                    ),

                    Expanded(
                      child: Container(

                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Countup(
                                  begin: 0,
                                  end: double.parse(provider.counterUpTemplateList.first.description!.fourthCounter??'40'),
                                  duration: Duration(seconds: 3),
                                  separator: ',',
                                  style: TextStyle(
                                      fontSize: 28,
                                      color: MyColor.blue,fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text('K',style: TextStyle(fontSize: 28,color: MyColor.blue,fontWeight: FontWeight.bold),)
                              ],
                            ),
                            SizedBox(height: 10,),
                            Flexible(child: Text(provider.counterUpTemplateList.first.description!.fourthContent??'5-star reviews on Trustpilot',textAlign: TextAlign.center,style: TextStyle(fontSize: 16,color: MyColor.grey),)),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),


          SizedBox(height: 20,),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff0dcaf0),
                    Color(0xff73c7ff),
                  ],
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 20,),
                Text('Ratings & Reviews',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 22),),
                SizedBox(height: 10,),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text('Check out our Rating on Trustpilot and other Platform',style: TextStyle(color: Colors.white,fontSize: 16),textAlign: TextAlign.center,),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          height: 80,
                          width: 160,
                          child: Image.network('https://remit.daneshexchange.com/assets/uploads/content/63d4b090cb59d1674883216.png'),
                        ),
                      ),
                      SizedBox(height: 10,),
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)
                          ),
                          child: Container(
                            height: 80,
                            width: 160,
                            child: Image.network('https://remit.daneshexchange.com/assets/uploads/content/63d4b0e34190e1674883299.png'),
                          ),
                        ),
                        onTap: () async{
                        },
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          height: 80,
                          width: 160,
                          child: Image.network('https://remit.daneshexchange.com/assets/uploads/content/63d4b0f6e84ea1674883318.png'),
                        ),
                      ),
                      SizedBox(height: 10,),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Container(
                          height: 80,
                          width: 160,
                          child: Image.network('https://remit.daneshexchange.com/assets/uploads/content/63d4be02c5ac81674886658.png'),
                        ),
                      ),
                      SizedBox(height: 10,),
                    ],
                  ),
                ),
                SizedBox(height: 20,)
              ],
            ),
          ),
          SizedBox(height: 20,),
          //slider
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 16),
                child: const Text('What our Clients think about Us',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              ),
              CustomCarouselSlider(
                items: itemList,
                height: 250,
                subHeight: 0,
                width: MediaQuery.of(context).size.width * .9,
                autoplay: true,
              ),
            ],
          ),
          //WHY CHOSE US
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  colors: [
                    Color(0xff0dcaf0),
                    Color(0xff73c7ff),
                  ],
                )
            ),
            child: Column(
              children: [
                SizedBox(height: 40,),
                Align(
                    alignment:Alignment.center,
                    child: Text(provider.aboutInfoModel.whychooseustemplate!.first.description!.title??'Why Chose Us?',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)),
                SizedBox(height: 30,),
                ...provider.whyChoseUsList.map((e) =>Column(
                  crossAxisAlignment:  CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(provider.baseImgUrl+e.content!.contentMedia!.description!.image!,height: 100,width: 100,),
                    Text(e.description!.title??'Save Time',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.white),),
                    Flexible(child: Html(
                      data: e.description!.shortDescription??'Nothing',style: {
                      'p':Style(textAlign: TextAlign.center,color: Colors.white,fontSize: FontSize(16)),
                    },
                    )),
                  ],)
                ),
              ],
            ),
          ),
          //Global support
          SizedBox(height: 20,),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Flexible(child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text('Global support in a range of languages',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),textAlign: TextAlign.left,),
                )),
                SizedBox(height: 10,),
                Wrap(
                  children: [
                    Text('''Why not purchase Euros online? Danesh Exchange's online ordering system allows the customer to place their order for foreign currency online and get it home delivered or collect from Australia Post stores.''',style: TextStyle(fontSize: 16),),
                    SizedBox(height: 30,),

                  ],
                ),
                SizedBox(height: 10,),
                Wrap(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [
                              Color(0xff0dcaf0),
                              Color(0xff73c7ff),
                            ],
                          )
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.transparent,
                          onSurface: Colors.transparent,
                          shadowColor: Colors.transparent,
                        ),
                          onPressed: (){
                         Navigator.pushNamed(context, ContactPage.routeName);
                      }, child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6),
                        child: Text('Contact Us',style: TextStyle(fontSize: 16),),
                      )),
                    )
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 20,),
          //Contact Us
          Container(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network('https://remit.daneshexchange.com/assets/uploads/content/63d79fdf5e6831675075551.png'),
                SizedBox(height: 20,),
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Create an Account',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                      SizedBox(height: 20,),
                      Wrap(
                        children: [
                          Text('''Why not purchase Euros online? Danesh Exchange's online ordering system allows the customer to place their order for foreign currency online and get it home delivered or collect from Australia Post stores.''')
                        ],
                      ),
                      SizedBox(height: 20,),
                      Wrap(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                gradient: LinearGradient(
                                  begin: Alignment.centerLeft,
                                  end: Alignment.centerRight,
                                  colors: [
                                    Color(0xff0dcaf0),
                                    Color(0xff73c7ff),
                                  ],
                                )
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent,
                                  onSurface: Colors.transparent,
                                  shadowColor: Colors.transparent,
                                ),
                                onPressed: (){
                                  Navigator.pushNamed(context, ContactPage.routeName);
                                }, child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 6),
                              child: Text('Contact Us',style: TextStyle(fontSize: 16),),
                            )),
                          )
                        ],
                      )
                    ],
                  ),
                )

              ],
            ),
          )


        ],
      ),
    );
  }
}



