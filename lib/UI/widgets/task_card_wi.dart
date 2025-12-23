import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/snack_bar.dart';
import 'package:task_management/data/model/task_model.dart';

import '../../data/Utils/urls.dart';
import '../../data/services/api_caller.dart';

class task_card extends StatefulWidget {
  const task_card({
    super.key, required this.taskModel, required this.cardColor, required this.refreshParent,
  });

  final TaskModel taskModel;
  final Color cardColor;
  final VoidCallback refreshParent;

  @override
  State<task_card> createState() => _task_cardState();
}

class _task_cardState extends State<task_card> {


  bool _changeStatusInProgress = false;

  Future<void> _changeStatus(String status) async {
    _changeStatusInProgress = true;
    setState(() {

    });

    final ApiResponse response = await ApiCaller.getRequest(
        url: Urls.changeStatus(widget.taskModel.id, status));
    _changeStatusInProgress = false;
    setState(() {

    });
    if (response.isSuccess) {
      widget.refreshParent();
      Navigator.pop(context);

    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
  }
  @override
  Widget build(BuildContext context) {

    void _showChangeStatusDialog(){
      showDialog(context: context, builder: (context){
        return AlertDialog(
          title: Text('Change Status'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                onTap: (){
                  _changeStatus('New');
                },
                title: Text('New'),
                trailing: widget.taskModel.status=='New'?Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Progress');
                },
                title: Text('Progress'),
                trailing: widget.taskModel.status=='Progress'?Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Cancelled');
                },
                title: Text('Cancelled'),
                trailing: widget.taskModel.status=='Cancelled'?Icon(Icons.done): null,
              ),
              ListTile(
                onTap: (){
                  _changeStatus('Completed');
                },
                title: Text('Completed'),
                trailing: widget.taskModel.status=='Completed'?Icon(Icons.done): null,
              ),
            ],
          ),
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        color: Colors.white,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8)
          ),
          title: Text(widget.taskModel.title,style: Theme.of(context).textTheme.titleLarge!.copyWith(
            fontSize: 18
          ),),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.taskModel.description),
              Text(' Date: ${ widget.taskModel.createdData}'),
              Row(
                children: [
                  Chip(label: Text(widget.taskModel.status),
                    backgroundColor: widget.cardColor,
                    labelStyle: TextStyle(color: Colors.white),
                    padding: EdgeInsets.symmetric(horizontal: 19),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){
                    _showChangeStatusDialog();

                  }, icon: Icon(Icons.edit_note_outlined,color: Colors.green,)),
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