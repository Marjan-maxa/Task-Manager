import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';

import 'forget_passward_varified_otp_screen.dart';

class SingUpScreen extends StatelessWidget {
  const SingUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ScreenBackround(
        child:Padding(
          padding: const EdgeInsets.all(25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 150,),
              Text('Join With Us',
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 10,),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ForgetPasswardVarifiedOtpScreen()));
                  }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,)
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
    );
  }
}
