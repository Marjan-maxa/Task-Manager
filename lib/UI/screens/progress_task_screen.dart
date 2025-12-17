import 'package:flutter/material.dart';

import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';
class ProgressTaskScreen extends StatefulWidget {
  const ProgressTaskScreen({super.key});

  @override
  State<ProgressTaskScreen> createState() => _ProgressTaskScreenState();
}

class _ProgressTaskScreenState extends State<ProgressTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(itemBuilder: (context,index){
          Text('');
          // return task_card(status: 'Completed', cardColor: Colors.purple,);
        }, separatorBuilder: (context,index){
          return SizedBox(height: 10,);
        }, itemCount: 10),
      ),
    );
  }
}
