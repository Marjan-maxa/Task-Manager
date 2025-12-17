import 'package:flutter/material.dart';

import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';

class CencelledTaskScreen extends StatefulWidget {
  const CencelledTaskScreen({super.key});

  @override
  State<CencelledTaskScreen> createState() => _CencelledTaskScreenState();
}

class _CencelledTaskScreenState extends State<CencelledTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.separated(itemBuilder: (context,index){
          return Text('');
          }, separatorBuilder: (context,index){
          return SizedBox(height: 10,);
        }, itemCount: 10),
      ),
    );
  }
}
