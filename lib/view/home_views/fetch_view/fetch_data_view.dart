import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';

class FetchDataView extends StatefulWidget {
  const FetchDataView({super.key});

  @override
  State<FetchDataView> createState() => _FetchDataViewState();
}

class _FetchDataViewState extends State<FetchDataView> {


 DbClass db= DbClass.instance;

 fetchData()
 {
   
 }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(text: 'Fetch Data View',fontSize: 20,fontWeight: FontWeight.bold,),

      ),
    );
  }
}
