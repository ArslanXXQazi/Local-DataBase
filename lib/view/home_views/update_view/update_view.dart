import 'package:flutter/material.dart';
import 'package:localdatabase/controller/components/custom_text.dart';

class UpdateView extends StatelessWidget {
  const UpdateView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: CustomText(text: 'Insert Data',fontWeight: FontWeight.bold,fontSize: 20,color: Colors.green,),
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
                loading=true;setState(() {});
                DbClass dbClass=DbClass.instance;
                if(titleController.text.isEmpty)
                {
                  loading=false;setState(() {});
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: CustomText(text: 'Please Enter Title',color: Colors.white,),
                        duration: Duration(seconds: 2),
                        backgroundColor: Colors.red,
                      ));
                }
                else
                {
                  if(descriptionController.text=='' || descriptionController.text==null)
                  {
                    descriptionController.text=='Description Not Aviliable';
                  }
                  int check= await dbClass.createWithOutModel(
                      title:titleController.text ,
                      description: descriptionController.text);
                  if(check==1)
                  {
                    loading=false;
                    setState(() {

                    });
                    ScaffoldMessenger.of(context).showSnackBar(

                        SnackBar(
                          content: CustomText(text: 'Data Added Successfully',color: Colors.white,),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.green,
                        ));
                  }
                  else
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: CustomText(text: 'Data Not Added',color: Colors.white,),
                          duration: Duration(seconds: 2),
                          backgroundColor: Colors.red,
                        ));
                  }

                }
                titleController.clear();
                descriptionController.clear();
              },
              text: 'Insert Data',
            )
          ],),
      ),
    );
  }
}
