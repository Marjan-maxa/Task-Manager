import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/UI/widgets/snack_bar.dart';
import 'package:task_management/data/model/task_model.dart';
import 'package:task_management/provider/task_provider.dart';

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




 Future<void> loadData()async {
   final taskProvider=Provider.of<TaskProvider>(context,listen:false);
  await Future.wait([
   taskProvider.FetchCount(),
   taskProvider.FetchNewTaskByStatus('New')
   ]);

 }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: task_manager_appBar(),
      body: Consumer<TaskProvider>(
        builder: (context,taskProvider,child) {
          return Column(
            children: [
              const SizedBox(height: 15,),
              SizedBox(
                height: 90,

                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: taskProvider.taskStatusCount.length,
                  itemBuilder: (context,index){
                    final counts=taskProvider.taskStatusCount;
                    return Task_Count_ByStatus(
                      title: counts[index].status,
                      count: counts[index].count,);
                  },
                  separatorBuilder: (context,index){
                    return SizedBox(width: 4,);

                  },
                ),
              ),



              Expanded(
                child: ListView.separated(
                  itemCount: taskProvider.newTasks.length,
                  itemBuilder: (context,index){
                    return task_card(
                      taskModel: taskProvider.newTasks[index],
                      cardColor: Colors.blue,
                      refreshParent: () async {
                       await loadData();


                      },
                    );
                  }, separatorBuilder: (context,index){
                  return SizedBox(height: 10,);
                }, ),
              )

            ],
          );
        }
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
