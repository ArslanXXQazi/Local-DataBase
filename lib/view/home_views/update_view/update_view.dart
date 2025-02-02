import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_button.dart';
import 'package:localdatabase/controller/components/custom_text.dart';
import 'package:localdatabase/controller/components/custom_textfield.dart';
import 'package:localdatabase/dphelper/dbhelper.dart';

class UpdateView extends StatefulWidget {
  final int id;
  final String title;
  final String description;

  UpdateView({
    super.key,
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  bool loading = false;
  DbClass helper = DbClass.instance;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.title;
    descriptionController.text = widget.description;
  }

  updateData() async {
    setState(() => loading = true);

    await helper.updateData(
      widget.id,
      title: titleController.text,
      description: descriptionController.text,
    );

    setState(() => loading = false);

    Navigator.pop(context, true); // Return true to refresh FetchDataView
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(
          text: 'Update Data',
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: Colors.green,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        child: Column(
          children: [
            CustomTextfield(
              controller: titleController,
              hintText: 'Enter title',
              labelText: 'Enter title',
            ),
            SizedBox(height: 15),
            CustomTextfield(
              controller: descriptionController,
              hintText: 'Enter description',
              labelText: 'Enter description',
            ),
            SizedBox(height: 15),
            loading
                ? CircularProgressIndicator()
                : CustomButton(
              onTap: updateData,
              text: 'Update Data',
            )
          ],
        ),
      ),
    );
  }
}
