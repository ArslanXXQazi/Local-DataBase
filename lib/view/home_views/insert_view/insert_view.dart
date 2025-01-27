import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';

class InsertView extends StatelessWidget {
  const InsertView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: 'Insert Data',fontWeight: FontWeight.bold,fontSize: 20,),
      ),
       body: Column(children: [




       ],),
    );
  }
}
