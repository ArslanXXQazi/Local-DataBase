import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  String text;
  Color color;
  double fontSize;
  FontWeight fontWeight;
   CustomText({super.key,
     required this.text,
     this.color=Colors.black,
     this.fontWeight=FontWeight.normal,
     this.fontSize=16,
   });

  @override
  Widget build(BuildContext context) {
    return Text(
        text,
      style: TextStyle(
        color:color ,
        fontSize:fontSize ,
        fontWeight: fontWeight
      ),
    );
  }
}
