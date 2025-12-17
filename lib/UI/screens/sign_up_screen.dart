import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';
import 'package:task_management/data/services/api_caller.dart';
import 'package:task_management/data/utils/urls.dart';

import 'forget_passward_varified_otp_screen.dart';

class SingUpScreen extends StatefulWidget {
  const SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

  class _SingUpScreenState extends State<SingUpScreen> {
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _firstNameController=TextEditingController();
  final TextEditingController _lastNameController=TextEditingController();
  final TextEditingController _mobileController=TextEditingController();
  final TextEditingController _passwardController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();

  bool _singUpInProgress=false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ScreenBackround(
        child:Padding(
          padding: const EdgeInsets.all(25.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 150,),
                  Text('Join With Us',
                    style: Theme.of(context).textTheme.titleLarge,),
                  const SizedBox(height: 10,),
                  TextFormField(
                    controller: _emailController,
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
                    controller: _firstNameController,
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
                    controller: _lastNameController,
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

                    controller: _mobileController,
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
                    controller: _passwardController,
                    decoration: InputDecoration(
                      hintText: ' Passward',
                    ),
                    validator: (String? value){
                      if(value==null || value.isEmpty)
                      {
                        return 'Please enter your passward';
                      }
                      if(value.trim().length<=6)
                      {
                        return 'Enter passward more than 6';
                      }
                    },
                  ),
                  const SizedBox(height: 20,),
                  Visibility(
                    visible: !_singUpInProgress,
                    replacement: Center(child: CircularProgressIndicator()),
                    child: FilledButton(
                        onPressed: (){
                          if(_formkey.currentState!.validate()){
                            _singUp();
                          }

                        }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,)
                    ),
                  ),
              
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(height: 20,),
                        RichText(text: TextSpan(
                          text: "Have account? ",
                          children: [
                            TextSpan(
                                text: 'Sing in',
                                style: TextStyle(
                                    color: Colors.green
                                )
                            )
                          ],
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold
                          ),
                        ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }



  _clearTextFeild(){
    _emailController.clear();
    _firstNameController.clear();
    _lastNameController.clear();
    _mobileController.clear();
    _passwardController.clear();
  }

  Future<void> _singUp() async {

setState(() {
  _singUpInProgress=true;
});
    Map<String,dynamic>requestBody={
      "email":_emailController.text,
      "firstName":_firstNameController.text,
      "lastName":_lastNameController.text,
      "mobile":_mobileController.text,
      "password":_passwardController.text,
    };
    final ApiResponse response=await ApiCaller.postRequest(
      url: Urls.registrationUrl,
      body: requestBody,
    );
    setState(() {
      _singUpInProgress=false;
    });
    if(response.isSuccess){
      _clearTextFeild();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SingUp Success!'),
        backgroundColor: Colors.green,duration: Duration(seconds: 3),));
    }else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.responseData['data']),
        backgroundColor: Colors.red,duration: Duration(seconds: 3),));
    }

  }

  @override
  void dispose() {
    _emailController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _mobileController.dispose();
    _passwardController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
