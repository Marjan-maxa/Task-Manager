import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../../provider/task_provider.dart';
import '../widgets/snack_bar.dart';
import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadData();
  }

  Future<void> loadData()async {
    final taskProvider=Provider.of<TaskProvider>(context,listen:false);
   await Future.wait([

      taskProvider.FetchNewTaskByStatus('Progress')
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
            itemCount: taskProvider.progressTasks.length,
            itemBuilder: (context,index){
              return task_card(
                taskModel: taskProvider.progressTasks[index],
                cardColor: Colors.blue,
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
