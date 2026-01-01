import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_management/UI/controller/auth_controller.dart';
import 'package:task_management/UI/screens/sign_up_screen.dart';

import 'package:task_management/UI/widgets/screen_backround.dart';
import 'package:task_management/data/model/user_model.dart';
import 'package:task_management/provider/network_provider.dart';

import '../../data/Utils/urls.dart';
import '../../data/services/api_caller.dart';
import '../../provider/auth_provider.dart';
import 'forget_passward_email_varified.dart';
import 'nav_bar_holder_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwardController=TextEditingController();
  final GlobalKey<FormState> _formkey=GlobalKey<FormState>();
  bool _singInProgress=false;


  @override
  Widget build(BuildContext context) {

    void ontapSingup()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>SingUpScreen()));
    }

    void ontapForgetPassward()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswardEmailVarified()));
    }

    return Scaffold(
      body: ScreenBackround(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: SingleChildScrollView(
            child: Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150,
                ),
                Text('Get Started With',
                style: Theme.of(context).textTheme.titleLarge,),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide.none
                    ),

                    fillColor:Colors.white,
                    filled: true,
                    hintText: 'Email',
                    hintStyle: TextStyle(
                      color: Colors.grey,

                    )
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
                const SizedBox(height: 20,),
                TextFormField(
                  controller: _passwardController ,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Passward'
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
               FilledButton(
                   onPressed: (){
                    if(_formkey.currentState!.validate()){
                      _singIn();
                    }
                   }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,)
               ),
                const SizedBox(height: 35,),
                Center(
                  child: Column(
                    children: [
                      TextButton(onPressed: ontapForgetPassward, child: Text('Forget Passward?'),),
                      RichText(text: TextSpan(
                          text: "Don't have an account? ",
                          children: [
                            TextSpan(
                                text: 'Sing up',
                                recognizer: TapGestureRecognizer()..onTap=ontapSingup,
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
        ),),
    );
  }


  _clearTextFeild(){
    _emailController.clear();
    _passwardController.clear();
  }

  Future<void> _singIn() async {
  final networkProvider=Provider.of<NetworkProvider>(context,listen: false);
  final authProvider=Provider.of<AuthProvider>(context,listen: false);
   final result=await networkProvider.login(
       email: _emailController.text.trim(),
       passward: _passwardController.text);

   if(result!=null){
     await authProvider.saveUserData(result['user'], result['token']);
     ApiCaller.accessToken = result['token'];
      _clearTextFeild();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('SingIn Success!'),
        backgroundColor: Colors.green,duration: Duration(seconds: 3),)

      );


      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavBarHolderScreen()));
    }

    else{
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(networkProvider.errorMassage??'Something worng'),
        backgroundColor: Colors.red,duration: Duration(seconds: 3),));


    }

  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwardController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
}
