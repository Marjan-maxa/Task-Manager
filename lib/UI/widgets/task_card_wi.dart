import 'package:flutter/material.dart';

class task_card extends StatelessWidget {
  const task_card({
    super.key,
  });

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
          title: Text('this is task',style: Theme.of(context).textTheme.titleLarge,),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Descrition of task'),
              Text('Date:29/11/25'),
              Row(
                children: [
                  Chip(label: Text('New'),
                    backgroundColor: Colors.blue,
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