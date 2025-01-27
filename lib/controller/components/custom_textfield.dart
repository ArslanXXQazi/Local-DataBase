import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  String hintText;
  String labelText;
 TextEditingController controller;
   CustomTextfield({super.key,
     required this.controller,
     required this.hintText,
     required this.labelText,
   });

  TextEditingController titleController=TextEditingController();

  TextEditingController descriptionController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: hintText,
        labelText: labelText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }
}
