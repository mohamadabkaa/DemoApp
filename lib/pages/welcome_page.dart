import 'package:demo_app/Widgets/responsive_button.dart';
import 'package:demo_app/cubit/app_cubit.dart';
import 'package:demo_app/pages/nevpages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:demo_app/Widgets/app_large_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Widgets/app_text.dart';
import 'package:demo_app/misc/colors.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}): super(key:key);

  @override
 _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];
  List Textarr =
      [
        "trip 1",
        "trip 2",
        "trip 3"
      ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body:PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 3,
            itemBuilder: (_,index){


              return Container(
                width: double.maxFinite,
                height:double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:AssetImage(
                            "img/"+images[index]
                        ),
                        fit:BoxFit.cover
                    )
                ),
                child:
                Container(
                    margin: const EdgeInsets.only(top:150,left:20, right: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment:CrossAxisAlignment.start,
                          children: [
                            AppLargeText(text: Textarr[index]),
                            AppLargeText(text: "Mountain",size: 30,),
                            SizedBox(height: 20,),
                            Container(
                              width: 250,
                              child: AppText(
                                text: "Mountain hikes give you an incredible sense of freedom along with endurance test",
                                color:AppColors.textColor2,
                                size: 14,
                              ),
                            ),
                            SizedBox(height:40,),
                            GestureDetector(
                                onTap: (){
                                  BlocProvider.of<AppCubits>(context).getData();
                                 /* Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const MainPage()),
                                  );
                                  */
                                },
                                 child: Container(
                                   width: 200,
                               child:Row(children:[ ResponsiveButton(width: 120,)])),
                               )

                          ],
                        ),

                        Column(
                          // ignore: dead_code
                          children:List .generate(3, (indexDots){
                            return Container(
                              margin:const EdgeInsets.only(bottom: 2),
                            width: 8,
                            height: index==indexDots?25:8,
                            decoration : BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)

                            ),
                            );
                          }),
                        )
                      ],
                    )
                ),
              );
            }),
      ),
    );
  }
}



