import 'package:flutter/material.dart';

class Task_Count_ByStatus extends StatelessWidget {
  const Task_Count_ByStatus({
    super.key, required this.title, required this.count,
  });
final String title;
final int count;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        child: Column(
          children: [
            Text(count.toString(),style: Theme.of(context).textTheme.titleLarge,),
            Text(title,),
          ],
        ),
      ),
    );
  }
}