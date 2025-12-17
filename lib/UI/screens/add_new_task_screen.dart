import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/snack_bar.dart';
import 'package:task_management/data/model/task_status_count_model.dart';
import 'package:task_management/data/services/api_caller.dart';

import '../../data/Utils/urls.dart';
import '../widgets/screen_backround.dart';
import '../widgets/taskManager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {


  TextEditingController titleController=TextEditingController();
  TextEditingController descriptionController=TextEditingController();

  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: ScreenBackround(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Form(
              key: _formkey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 70,),
                      Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: titleController,
                        decoration: InputDecoration(
                          hintText: 'Subject'
                        ),
                        validator: (String? value){
                          if(value==null || value.isEmpty)
                          {
                            return 'Please enter your subject';
                          }
                          return null;
                
                        },
                      ),
                      const SizedBox(height: 20,),
                      TextFormField(
                        controller: descriptionController,
                        maxLines: 7,
                        decoration: InputDecoration(
                            hintText: 'Description'
                        ),
                        validator: (String? value){
                          if(value==null || value.isEmpty)
                          {
                            return 'Please enter your description';
                          }
                          return null;
                
                        },
                      ),
                      const SizedBox(height: 20,),
                      FilledButton(onPressed: (){
                
                        if(_formkey.currentState!.validate()){
                          addNewTask();
                        }
                      }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,),)
                      ]),
              ),
            ),
          )),
    );
  }
  bool addTaskProgress=false;
  Future<void>addNewTask()async {
    addTaskProgress=true;
    setState(() {

    });

    Map<String,dynamic>requestBody={

      "title":titleController.text,
    "description":descriptionController.text,
    "status":"New"
    };

    final ApiResponse response=await ApiCaller.postRequest(
        url: Urls.createTaskUrl,
        body: requestBody);
    addTaskProgress=false;
    setState(() {

    });

    if(response.isSuccess){
      _clearFeild();
      showSnackBarMessage(context, 'New task Added');
    }else{
      showSnackBarMessage(context, response.errorMessage!);
    }

  }


  _clearFeild(){
    titleController.clear();
    descriptionController.clear();
  }

}
