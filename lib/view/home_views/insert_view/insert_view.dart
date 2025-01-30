import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_button.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/controller/components/custom_textfield.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';
import 'package:localdatabase/model/model.dart';
import 'package:localdatabase/view/home_views/fetch_view/fetch_data_view.dart';
import 'package:sqflite/sqflite.dart';

class InsertView extends StatefulWidget {
  const InsertView({super.key});

  @override
  State<InsertView> createState() => _InsertViewState();
}

class _InsertViewState extends State<InsertView> {
  //============================>> Controller
  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();
  DbClass helper=DbClass.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: 'Insert Data',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green,),
      ),
       body: Padding(
         padding: const EdgeInsets.symmetric(horizontal: 20),
         child: Column(children: [
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
           CustomButton(
               onTap: ()
                {
                 DbClass dbClass=DbClass.instance;
                 dbClass.createWithOutModel(
                     title: ,
                     description: );
                },
               text: 'Insert Data',
           )
         ],),
       ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
        FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>FetchDataView()));
        },child: CustomText(text: 'Fetch'),),
      ],),
    );
  }
}
