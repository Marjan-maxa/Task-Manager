import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:task_management/UI/controller/auth_controller.dart';

import '../screens/update_profile_screen.dart';

class task_manager_appBar extends StatelessWidget implements PreferredSizeWidget {
  const task_manager_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final profilePhoto=AuthController.userModel!.photo;

    return AppBar(
      actions: [
        IconButton(onPressed: (){
         AuthController.userClearData();
         Navigator.pushNamedAndRemoveUntil(context, '/Login', (predicate)=>false);

        }, icon: Icon(Icons.logout))
      ],
      backgroundColor: Colors.green,
      title: InkWell(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>UpdateProfileScreen()));
        },
        child: Row(
          children: [
            CircleAvatar(
              child: profilePhoto.isNotEmpty? Image.memory(jsonDecode(profilePhoto)):Icon(Icons.person)
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('${AuthController.userModel!.firstName} ${AuthController.userModel!.lastName}',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    color: Colors.white
                ),),
                Text(AuthController.userModel!.email,style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: Colors.white
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}