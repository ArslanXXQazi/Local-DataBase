import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';
import 'package:localdatabase/model/model.dart';
import 'package:localdatabase/view/home_views/update_view/update_view.dart';

class FetchDataView extends StatefulWidget {
  const FetchDataView({super.key});

  @override
  State<FetchDataView> createState() => _FetchDataViewState();
}

class _FetchDataViewState extends State<FetchDataView> {
  DbClass db = DbClass.instance;
  List<MainModel> data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  fetchData() async {
    var fetchDataList = await db.read();
    setState(() {
      data = fetchDataList
          .map((noteMap) => MainModel(
        id: noteMap['id'],
        title: noteMap['title'],
        description: noteMap['description'],
      ))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          text: 'Fetch Data View',
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: data.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.pink.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomText(
                      text: "Student Data",
                      fontSize: 20,
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                    ),
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/arslan.jpg'),
                    ),
                    CustomText(
                      text: data[index].title ?? "",
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    CustomText(
                      text: data[index].description ?? "",
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    SizedBox(height: 10),
                    Divider(color: Colors.green),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              text: 'Delete Data',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            IconButton(
                              onPressed: () {
                                db.deleteData(data[index].id!);
                                setState(() {
                                  data.removeAt(index);
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            CustomText(
                              text: 'Update Data',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                            IconButton(
                              onPressed: () async {
                                bool result = await Navigator.push(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => UpdateView(
                                          id: data[index].id!,
                                          title:
                                          data[index].title ?? "",
                                          description: data[index]
                                              .description ??
                                              "",
                                        )));
                                if (result == true) {
                                  fetchData();
                                }
                              },
                              icon: Icon(
                                Icons.update,
                                color: Colors.green,
                                size: 30,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
