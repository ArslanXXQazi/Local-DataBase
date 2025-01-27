import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';

class CustomButton extends StatelessWidget {
  VoidCallback onTap;
  String text;
  CustomButton({super.key,required this.onTap,required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed:onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          minimumSize: Size(double.infinity, 56),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          )
        ),
        child: CustomText(text: text,fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white,),
    );
  }
}
