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
          id: noteMap['id'],
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
             return
               Padding(
                 padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                 child: Container(
                 height:  230,
                   decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                   borderRadius: BorderRadius.circular(10),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                   child: Column(
                     children: [
                       CustomText(text: "Student Data ",fontSize: 20,color: Colors.yellow,fontWeight: FontWeight.bold,),
                       CircleAvatar(
                         radius: 30,
                       ),
                       CustomText(text: data[index].title??"",color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20,),
                       CustomText(text: data[index].description??"",color: Colors.white,fontWeight: FontWeight.normal,fontSize: 15),
                       SizedBox(height: 10,),
                    Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.green,
                    ),
                       SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Row(children: [
                          CustomText(text: 'Delete Data',color: Colors.white,fontWeight: FontWeight.bold,),
                          IconButton(
                            onPressed: (){
                              db.deleteData(data[index].id!);
                              setState(() {
                                data.removeAt(index);
                              });
                            },
                            icon:  Icon(Icons.delete,color: Colors.red,size: 30,),),
                        ],),
                        Row(children: [
                          CustomText(text: 'Update Data',color: Colors.white,fontWeight: FontWeight.bold,),
                          IconButton(
                            onPressed: (){},
                            icon:  Icon(Icons.update,color: Colors.green,size: 30,),),
                        ],),
                      ],)

                   ],),
                 ),
                 ),
               );

            //    ListTile(
            //   onTap: (){
            //     db.deleteData(data[index].id!);
            //     setState(() {
            //       data.removeAt(index);
            //     });
            //   },
            //   leading: CircleAvatar(
            //     child: Text(data[index].id.toString()),
            //   ),
            //   title: CustomText(text: data[index].title??"",color: Colors.red,),
            //   subtitle: CustomText(text: data[index].description??"",color: Colors.green,),
            // );
          },
        ),
      );
    }
  }