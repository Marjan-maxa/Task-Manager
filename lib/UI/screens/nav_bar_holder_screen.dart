import 'package:flutter/material.dart';
import 'package:task_management/UI/screens/new_task_screen.dart';
import 'package:task_management/UI/screens/progress_task_screen.dart';

class NavBarHolderScreen extends StatefulWidget {
  const NavBarHolderScreen({super.key});

  @override
  State<NavBarHolderScreen> createState() => _NavBarHolderScreenState();
}

class _NavBarHolderScreenState extends State<NavBarHolderScreen> {
  int _selectedIndex=0;
 List<Widget> _screens=[
   NewTaskScreen(),
   ProgressTaskScreen(),
   ProgressTaskScreen(),
   ProgressTaskScreen(),
 ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
          onDestinationSelected: (int index){
          _selectedIndex=index;
          setState(() {

          });
          },
          destinations: [
        NavigationDestination(icon: Icon(Icons.refresh), label: 'New Task'),
        NavigationDestination(icon: Icon(Icons.refresh), label: 'Completed'),
        NavigationDestination(icon: Icon(Icons.close), label: 'Cancelled'),
        NavigationDestination(icon: Icon(Icons.done_all), label: 'Progress'),
      ]),
    );
  }
}
