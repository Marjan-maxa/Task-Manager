import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';
import 'package:task_management/UI/widgets/taskManager_app_bar.dart';

import '../widgets/photo_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final ImagePicker imgpicker = ImagePicker();
  XFile?_selectedImg;
  Future<void>pickImg() async {
    final XFile? image = await imgpicker.pickImage(source: ImageSource.camera);
    if(image!=null)
      {
        _selectedImg=image;
        setState(() {

        });
      }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: task_manager_appBar(),
      body: ScreenBackround(child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 70,),
                Text('Update Profile',
                  style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 10,),

                photo_picker(onTap: pickImg,selectedPhoto: _selectedImg,),

                const SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: ' Email',
                  ),
                ),
                const SizedBox(height: 15,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'First Name',
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Last Name',
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: 'Mobile',
                  ),
                ),
                const SizedBox(height: 20,),
                TextFormField(
                  decoration: InputDecoration(
                    hintText: ' Passward',
                  ),
                ),
                const SizedBox(height: 20,),
                FilledButton(
                    onPressed: (){

                    }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,)
                ),

                Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 20,),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}


