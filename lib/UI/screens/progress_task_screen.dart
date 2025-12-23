import 'package:flutter/material.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../widgets/snack_bar.dart';
import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  bool _getProgressTaskProgress = false;
  List<TaskModel>_progressTaskList=[];


  Future<void> _getAllTask() async {
    _getProgressTaskProgress=true;
    setState(() {

    });

    final ApiResponse response=await ApiCaller.getRequest(url: Urls.progressTaskUrl);
    _getProgressTaskProgress=false;
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
    _progressTaskList=list;

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
        child: ListView.separated(
        itemCount: _progressTaskList.length,
        itemBuilder: (context,index){
          return task_card(taskModel: _progressTaskList[index],
            cardColor: Colors.blue,
            refreshParent: (){
            },
          );
        }, separatorBuilder: (context,index){
        return SizedBox(height: 10,);
      }, ),
      ),
    );
  }
}
