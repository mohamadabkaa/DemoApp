import 'package:demo_app/Widgets/app_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:demo_app/misc/colors.dart';
import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  final bool? isResponsive;
  final double? width;
  const ResponsiveButton({Key? key,this.width=120,this.isResponsive=false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child:Container(
    width:isResponsive==true? double.maxFinite:width,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
            color: AppColors.mainColor
      ),
    child: Row(
      mainAxisAlignment:isResponsive==true?MainAxisAlignment.spaceBetween:MainAxisAlignment.center,
      children: [
        isResponsive==true?Container(margin:const EdgeInsets.only(left: 20),
            child:AppText(text: "Book Trip Now",size:20,color:Colors.white)):Container(),
        Image.asset("img/button-one.png"),
      ],

      ),
      ));
  }
}
