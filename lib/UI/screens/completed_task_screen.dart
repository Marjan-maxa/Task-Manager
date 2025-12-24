import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/taskManager_app_bar.dart';
import 'package:task_management/UI/widgets/task_card_wi.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../widgets/snack_bar.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});


  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {

  bool isloading = false;
  List<TaskModel>_completedTaskList=[];


  Future<void> _getAllTask() async {
    isloading=true;
    setState(() {

    });

    final ApiResponse response=await ApiCaller.getRequest(url: Urls.completedTaskUrl);
    isloading=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess) {
      for (Map<String, dynamic>jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _completedTaskList=list;

  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAllTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Visibility(
          visible: isloading==false,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _completedTaskList.length,
            itemBuilder: (context,index){
              return task_card(taskModel: _completedTaskList[index],
                cardColor: Colors.blue,
                refreshParent: (){
                  _getAllTask();

                },
              );
            }, separatorBuilder: (context,index){
            return SizedBox(height: 10,);
          }, ),
        ),
      ),
    );
  }
}
