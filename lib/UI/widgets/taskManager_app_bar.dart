import 'package:flutter/material.dart';

class task_manager_appBar extends StatelessWidget implements PreferredSizeWidget {
  const task_manager_appBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.logout))
      ],
      backgroundColor: Colors.green,
      title: Row(
        children: [
          CircleAvatar(),
          const SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Md. Marjan',style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.white
              ),),
              Text('Abc@gmail.com',style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Colors.white
              ),),
            ],
          )
        ],
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}