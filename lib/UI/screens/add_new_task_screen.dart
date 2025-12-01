import 'package:flutter/material.dart';

import '../widgets/screen_backround.dart';
import '../widgets/taskManager_app_bar.dart';

class AddNewTaskScreen extends StatefulWidget {
  const AddNewTaskScreen({super.key});

  @override
  State<AddNewTaskScreen> createState() => _AddNewTaskScreenState();
}

class _AddNewTaskScreenState extends State<AddNewTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: ScreenBackround(
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 70,),
                  Text('Add New Task',style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 20,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Subject'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    maxLines: 7,
                    decoration: InputDecoration(
                        hintText: 'Description'
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FilledButton(onPressed: (){}, child: Icon(Icons.arrow_circle_right_outlined,size: 23,),)
                  ]),
          )),
    );
  }
}
