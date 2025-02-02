import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_button.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/controller/components/custom_textfield.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';

class UpdateView extends StatefulWidget {

  String id;

  UpdateView({super.key,required this.id});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override
 bool  loading =false;
 DbClass helper=DbClass.instance;

  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: 'Update Data',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green,),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 30),
        child: Column(
          children: [
            CustomTextfield(
              controller:titleController ,
              hintText: 'Enter title',
              labelText: 'Enter title',
            ),
            SizedBox(height: 15),
            CustomTextfield(
              controller:descriptionController ,
              hintText: 'Enter descriptions',
              labelText: 'Enter descriptions',
            ),
            SizedBox(height: 15),
            loading?CircularProgressIndicator():
            CustomButton(
              onTap:() async
             {
               helper.updateData(id, title: title, description: description)
             },
              text: 'Update Data',
            )
          ],),
      ),
    );
  }
}
