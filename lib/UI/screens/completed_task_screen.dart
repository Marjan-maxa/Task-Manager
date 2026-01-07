import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/UI/widgets/taskManager_app_bar.dart';
import 'package:task_management/UI/widgets/task_card_wi.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../provider/task_provider.dart';
import '../widgets/snack_bar.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});


  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {






  @override
  void initState() {
    // TODO: implement initState
    super.initState();
      loadData();
  }

  Future<void> loadData()async {
    final taskProvider=Provider.of<TaskProvider>(context,listen:false);
   await Future.wait([

      taskProvider.FetchNewTaskByStatus('Completed')
    ]);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Consumer<TaskProvider>(
          builder: (context,taskProvider,child) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: ListView.separated(
              itemCount: taskProvider.completedTasks.length,
              itemBuilder: (context,index){
                return task_card(taskModel: taskProvider.completedTasks[index],
                  cardColor: Colors.green,
                  refreshParent: (){

                          loadData();
                  },
                );
              }, separatorBuilder: (context,index){
              return SizedBox(height: 10,);
            }, ),
          );
        }
      ),
    );
  }
}
