import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/snack_bar.dart';
import 'package:task_management/data/model/task_model.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_status_count_model.dart';
import '../../data/services/api_caller.dart';
import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';
import '../widgets/task_count_bystatus.dart';
import 'add_new_task_screen.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {

  bool _getTaskStatusCountProgress=false;
  bool _getNewTaskProgress=false;


  List<TaskStatusCountModel>taskStatusCountlist=[];
  List<TaskModel>newtaskList=[];

  Future<void> _getAlltaskCount() async {
    _getTaskStatusCountProgress=true;
    setState(() {

    });

    final ApiResponse response=await ApiCaller.getRequest(url: Urls.taskStatusCountUrl);
    _getTaskStatusCountProgress=false;
    setState(() {

    });
    List<TaskStatusCountModel> list=[];
    if(response.isSuccess) {
      for (Map<String, dynamic>jsonData in response.responseData['data']) {
        list.add(TaskStatusCountModel.fromJson(jsonData));
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    taskStatusCountlist=list;
    print(taskStatusCountlist.length);
    print(taskStatusCountlist);

  }

  Future<void> _getAllNewtaskCount() async {
    _getNewTaskProgress=true;
    setState(() {

    });

    final ApiResponse response=await ApiCaller.getRequest(url: Urls.newTaskUrl);
    _getNewTaskProgress=false;
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
    newtaskList=list;
setState(() {

});
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getAlltaskCount();
    _getAllNewtaskCount();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: task_manager_appBar(),
      body: Column(
        children: [
          const SizedBox(height: 15,),
          SizedBox(
            height: 90,

            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: taskStatusCountlist.length,
              itemBuilder: (context,index){
                return Task_Count_ByStatus(title: taskStatusCountlist[index].status,
                  count: taskStatusCountlist[index].count,);
              },
              separatorBuilder: (context,index){
                return SizedBox(width: 4,);

              },
            ),
          ),



          Expanded(
            child: ListView.separated(
              itemCount: newtaskList.length,
              itemBuilder: (context,index){
                return task_card(taskModel: newtaskList[index],
                  cardColor: Colors.blue,
                  refreshParent: (){
                  },
                );
              }, separatorBuilder: (context,index){
              return SizedBox(height: 10,);
            }, ),
          )

        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>AddNewTaskScreen()));
        }, child: Icon(Icons.add),),
    );
  }
}
