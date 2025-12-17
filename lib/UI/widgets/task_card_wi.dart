import 'package:flutter/material.dart';
import 'package:task_management/data/model/task_model.dart';

class task_card extends StatelessWidget {
  const task_card({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          title: Text(taskModel.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 18
          ),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(taskModel.description),
              Text(' Date: ${ taskModel.createdData}'),
              Row(
                children: [
                  Chip(label: Text(taskModel.status),
                    backgroundColor: cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){}, icon: Icon(Icons.edit_note_outlined,color: Colors.green,)),
                  IconButton(onPressed: (){}, icon: Icon(Icons.delete,color: Colors.red,))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}