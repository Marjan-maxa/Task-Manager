import 'package:flutter/material.dart';

import '../../data/Utils/urls.dart';
import '../../data/model/task_model.dart';
import '../../data/services/api_caller.dart';
import '../widgets/snack_bar.dart';
import '../widgets/taskManager_app_bar.dart';
import '../widgets/task_card_wi.dart';

class CencelledTaskScreen extends StatefulWidget {
  const CencelledTaskScreen({super.key});

  @override
  State<CencelledTaskScreen> createState() => _CencelledTaskScreenState();
}

class _CencelledTaskScreenState extends State<CencelledTaskScreen> {

bool cancelisLoading=false;
List<TaskModel>_cancelledTaskList=[];

  Future<void> _getCancelTask() async {
    cancelisLoading=true;
    setState(() {

    });

    final ApiResponse response=await ApiCaller.getRequest(url: Urls.cancelledTaskUrl);
    cancelisLoading=false;
    setState(() {

    });
    List<TaskModel> list=[];
    if(response.isSuccess) {
      for (Map<String, dynamic>jsonData in response.responseData['data']) {
        list.add(TaskModel.fromJson(jsonData));
      }
    }else{
      showSnackBarMessage(context, response.errorMessage.toString());
    }
    _cancelledTaskList=list;

  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getCancelTask();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Visibility(
          visible: cancelisLoading==false,
          replacement: Center(child: CircularProgressIndicator()),
          child: ListView.separated(
            itemCount: _cancelledTaskList.length,
            itemBuilder: (context,index){
              return task_card(taskModel: _cancelledTaskList[index],
                cardColor: Colors.blue,
                refreshParent: (){
                  _getCancelTask();

                },
              );
            }, separatorBuilder: (context,index){
            return SizedBox(height: 10,);
          }, ),
        ),
      ),
    );
  }
}
