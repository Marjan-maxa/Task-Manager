import 'package:flutter/material.dart';

import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';
import '../widgets/task_count_bystatus.dart';
class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
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
              itemCount: 4,
                itemBuilder: (context,index){
              return Task_Count_ByStatus(title: 'Cancelled', count: index+4,);
             },
              separatorBuilder: (context,index){
                return SizedBox(width: 4,);

              },
            ),
          ),

          Expanded(
            child: ListView.separated(
                itemCount: 12,
              itemBuilder: (context,index){
                  return task_card();
            }, separatorBuilder: (context,index){
                  return SizedBox(height: 10,);
            }, ),
          )

        ],
      ),
    );
  }
}






