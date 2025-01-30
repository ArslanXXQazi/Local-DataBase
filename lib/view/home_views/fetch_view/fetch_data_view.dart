import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';
import 'package:localdatabase/model/model.dart';

class FetchDataView extends StatefulWidget {
  const FetchDataView({super.key});

  @override
  State<FetchDataView> createState() => _FetchDataViewState();
}

class _FetchDataViewState extends State<FetchDataView> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }
  DbClass db = DbClass.instance;
  List <MainModel> data = [];

  fetchData() async
  {
    var fetchDataList = await db.read();
    data = fetchDataList.map((noteMap) {
      return MainModel(
          title: noteMap['title'],
          description: noteMap['description']);
    }).toList();
    setState(() {});
  }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: CustomText(text: 'Fetch Data View',
            fontSize: 20,
            fontWeight: FontWeight.bold,),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context,index)
          {
            return ListTile(
              title: CustomText(text: data[index].title??'',color: Colors.red,),
              subtitle: CustomText(text: data[index].description??'',color: Colors.green,),
            );
          },
        ),
      );
    }
  }