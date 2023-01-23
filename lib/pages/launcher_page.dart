import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:remit_app/colors.dart';
import 'package:remit_app/pages/login_page.dart';
import 'package:remit_app/pages/registration_page.dart';

class LauncherPage extends StatelessWidget {
  static const String routeName='/';
  const LauncherPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Container(
        color: Colors.white,
        child: ListView(
          children: [


            Wrap(
              children:  [

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text:  TextSpan(
                      style: GoogleFonts.rubik(),
                      children: <TextSpan>[
                        TextSpan(text: 'Send money ',style: GoogleFonts.rubik(textStyle: TextStyle(fontSize: 22, height: 1.5,color: MyColor.blue,),)),
                        TextSpan(text: 'anywhere in the world, ', style: TextStyle(fontSize: 22, height: 1.5,color: MyColor.grey)),
                        TextSpan(text: 'Faster',style: TextStyle(fontSize: 22, height: 1.5,color: MyColor.blue)),
                        TextSpan(text: ' and ',style: TextStyle(fontSize: 22, height: 1.5,color: MyColor.grey)),
                        TextSpan(text: ' Cheaper ',style: TextStyle(fontSize: 22, height: 1.5,color: MyColor.blue)),
                        TextSpan(text: 'than your bank.',style: TextStyle(fontSize: 22, height: 1.5,color: MyColor.grey)),
                      ],

                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            SvgPicture.asset('svg/launcher_icon.svg'),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Wrap(
                children:  [
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc vulputate libero et .',
                    style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 15,color: Colors.grey)),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromHeight(50),
                  backgroundColor: MyColor.blue
                ),
                onPressed: () {
                  Navigator.pushNamed(context, SignupPage.routeName);
                },
                child:  Text(
                  'Create a free account',
                  style: GoogleFonts.rubik(textStyle: const TextStyle(fontSize: 16)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      fixedSize: const Size.fromHeight(50),
                      side:  BorderSide(
                          color: MyColor.blue,
                          width: 1
                      )
                  ),
                  onPressed: ()  {
                   // Navigator.pushNamed(context, CalculatorPage.routeName);
                  },
                  child:  Text('View Exchange Rates',style: GoogleFonts.rubik(
                    textStyle: TextStyle(color: MyColor.blue,fontSize: 16),
                  ))),
            ),
            const SizedBox(height: 15,),
             InkWell(
               child: RichText(
                 textAlign: TextAlign.center,
                   text: TextSpan(
                children: [
                  TextSpan(text: 'Already have an account?',style: TextStyle(color: MyColor.greyLight,fontSize: 16)),
                  TextSpan(text: ' Login', style:TextStyle(color: MyColor.blue,fontSize: 16,fontWeight: FontWeight.w500)),
                ]
            )),
               onTap: (){
                 Navigator.pushNamed(context, LoginPage.routeName);
               },
             )
          ],
        ),
      ),
    );
  }
}
