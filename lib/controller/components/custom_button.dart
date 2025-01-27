import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: (){},
        child: CustomText(text: 'Add Data'),
    );
  }
}
