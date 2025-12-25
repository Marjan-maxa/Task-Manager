import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_management/UI/controller/auth_controller.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';
import 'package:task_management/UI/widgets/snack_bar.dart';
import 'package:task_management/UI/widgets/taskManager_app_bar.dart';
import 'package:task_management/data/model/user_model.dart';
import 'package:task_management/data/services/api_caller.dart';


import '../../data/Utils/urls.dart';
import '../widgets/photo_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  TextEditingController emailController=TextEditingController();
  TextEditingController firstNameController=TextEditingController();
  TextEditingController lastNameController=TextEditingController();
  TextEditingController mobileController=TextEditingController();
  TextEditingController passwardNameController=TextEditingController();

  final ImagePicker imgpicker = ImagePicker();
  XFile?_selectedImg;

  final GlobalKey<FormState> _formKey=GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = AuthController.userModel;
      if (user != null) {
        setState(() {
          emailController.text = user.email;
          firstNameController.text = user.firstName;
          lastNameController.text = user.lastName;
          mobileController.text = user.mobile;
        });
      }
    });

  }
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
            child: Form(
              key: _formKey,
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
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: ' Email',
                    ),

                    validator: (String ? value){
                      if(value==null || value.isEmpty){
                        return 'Please enter your email';
                      }
                      final emailRegExp = RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.(com|net|org|edu|bd)$',
                      );


                      if(!emailRegExp.hasMatch(value)){
                        return 'Please Enter valid Email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 15,),
                  TextFormField(
                    controller: firstNameController,
                    decoration: InputDecoration(
                      hintText: 'First Name',
                    ),
                    validator: (String? value){
                      if(value==null || value.isEmpty)
                      {
                        return 'Please enter your first name';
                      }
                      if(value.trim().length<2)
                      {
                        return 'First name must be at least 2 character';
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: lastNameController,
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                    ),
                    validator: (String? value){
                      if(value==null || value.isEmpty)
                      {
                        return 'Please enter your last name';
                      }
                      if(value.trim().length<2)
                      {
                        return 'First name must be at least 2 character';
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: mobileController,
                    decoration: InputDecoration(
                      hintText: 'Mobile',
                    ),
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your mobile number';
                      }

                      final bdPhoneRegExp = RegExp(r'^(013|014|015|016|017|018|019)\d{8}$');

                      if (!bdPhoneRegExp.hasMatch(value.trim())) {
                        return 'Enter a valid Bangladesh mobile number';
                      }

                      return null;
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    obscureText: true,
                    controller: passwardNameController,
                    decoration: InputDecoration(
                      hintText: ' Passward',
                    ),
                  ),
                  const SizedBox(height: 20,),
                  FilledButton(
                      onPressed: (){

                        if(_formKey.currentState!.validate()){
                          updateProfile();
                        }

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
          ),
        ],
      )),
    );
  }
  bool isLoading=false;
  Future<void>updateProfile() async {
    isLoading=true;
    setState(() {

    });
    Map<String,dynamic>requestBody={
      "email":emailController.text,
      "firstName":firstNameController.text,
      "lastName":lastNameController.text,
      "mobile":mobileController.text,

    };

    if(passwardNameController.text.isNotEmpty){
      requestBody['passward']=passwardNameController.text;
    }
    String ? encodedPhoto;
    if(_selectedImg!=null){
      List<int>byte=await _selectedImg!.readAsBytes();
      encodedPhoto=jsonEncode(byte);
      requestBody['photo']=encodedPhoto;
    }
    final ApiResponse response=await ApiCaller.postRequest(url: Urls.updateProfileUrl,body: requestBody);
  isLoading=false;
  setState(() {

});
  if(response.isSuccess){
    UserModel model=UserModel(
        id: AuthController.userModel!.id,
        email: emailController.text,
        firstName: firstNameController.text,
        lastName: lastNameController.text,
        mobile: mobileController.text,
        photo: encodedPhoto?? AuthController.userModel!.photo
    );

    AuthController.updateUserData(model);
    showSnackBarMessage(context, 'Profile Updated');
  }else{
    showSnackBarMessage(context, response.errorMessage.toString());
  }

  }

}


