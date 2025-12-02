import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/taskManager_app_bar.dart';
import 'package:task_management/UI/widgets/task_card_wi.dart';

class CompletedTaskScreen extends StatefulWidget {
  const CompletedTaskScreen({super.key});


  @override
  State<CompletedTaskScreen> createState() => _CompletedTaskScreenState();
}

class _CompletedTaskScreenState extends State<CompletedTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(itemBuilder: (context,index){
          return task_card(status: 'Completed', cardColor: Colors.green,);
        }, separatorBuilder: (context,index){
          return SizedBox(height: 10,);
        }, itemCount: 10),
      ),
    );
  }
}
