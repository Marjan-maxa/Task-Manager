import 'package:flutter/cupertino.dart';
import 'package:task_management/core/enums/api_state.dart';
import 'package:task_management/data/model/task_model.dart';
import 'package:task_management/data/model/task_status_count_model.dart';

import '../data/Utils/urls.dart';
import '../data/services/api_caller.dart';

class TaskProvider extends ChangeNotifier{
 List<TaskModel> _newTasks=[];
 List<TaskModel> _progressTasks=[];
 List<TaskModel> _completedTasks=[];
 List<TaskModel> _cancelledTasks=[];

 List<TaskStatusCountModel> _taskStatusCount=[];

 String ? _errorMassage;


 ApiState _taskListState=ApiState.initial;
 ApiState _taskCountState=ApiState.initial;

 List<TaskModel> get newTasks=>_newTasks;
 List<TaskModel> get progressTasks=>_progressTasks;
 List<TaskModel> get completedTasks=>_completedTasks;
 List<TaskModel> get cancelledTasks=>_cancelledTasks;
 List<TaskStatusCountModel> get taskStatusCount=>_taskStatusCount;


Future<void>FetchCount() async {
  _taskCountState=ApiState.loading;

  final ApiResponse response=
  await ApiCaller.getRequest(url: Urls.taskStatusCountUrl);
  if(response.isSuccess){
    _taskStatusCount=[];
    for (Map<String, dynamic>jsonData in response.responseData['data']) {
      _taskStatusCount.add(TaskStatusCountModel.fromJson(jsonData));
      _taskCountState=ApiState.success;
     _errorMassage=null;
    }
  }else{
    _taskCountState=ApiState.error;
    _errorMassage=response.errorMessage?? 'Failed TaskStatus Count!';

  }
  notifyListeners();
}


 Future<void>FetchNewTaskByStatus(String status) async {
   _taskListState=ApiState.loading;

  String url;
   switch(status){
     case('New'):
       url=Urls.newTaskUrl;
       break;
     case('Progress'):
       url=Urls.progressTaskUrl;
       break;
     case('Completed'):
       url=Urls.completedTaskUrl;
       break;
     case('Cancelled'):
       url=Urls.cancelledTaskUrl;
     default:
       url=Urls.newTaskUrl;

   }

   final ApiResponse response=await ApiCaller.getRequest(url: url);
   if(response.isSuccess)
   {
    List<TaskModel>tasks=[];
     for (Map<String, dynamic>jsonData in response.responseData['data'])
      {
       tasks.add(TaskModel.fromJson(jsonData));
       }

       switch(status)
       {
         case('New'):
           _newTasks=tasks;
           break;
         case('Progress'):
          _progressTasks=tasks;
           break;
         case('Completed'):
          _completedTasks=tasks;
           break;
         case('Cancelled'):
           _cancelledTasks=tasks;
         default:
           _newTasks=tasks;

       }
       _taskListState=ApiState.success;
       _errorMassage=null;

     }
   else{
     _taskListState=ApiState.error;
     _errorMassage=response.errorMessage?? 'Failed NewTaskStatus list!';

   }
   notifyListeners();
 }

}