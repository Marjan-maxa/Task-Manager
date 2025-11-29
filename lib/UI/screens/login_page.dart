import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:task_management/UI/screens/sign_up_screen.dart';

import 'package:task_management/UI/widgets/screen_backround.dart';

import 'forget_passward_email_varified.dart';
import 'nav_bar_holder_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}



class _LoginPageState extends State<LoginPage> {

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
              ),
              const SizedBox(height: 20,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Passward'
                ),
              ),
              const SizedBox(height: 20,),
             FilledButton(
                 onPressed: (){
                   Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>NavBarHolderScreen()));
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
        ),),
    );
  }
}
