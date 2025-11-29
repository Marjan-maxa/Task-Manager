import 'package:flutter/material.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';

import 'forget_passward_varified_otp_screen.dart';

class ResetPasswaardScreen extends StatelessWidget {
  const ResetPasswaardScreen({super.key});

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
              Text('Reset Passward',
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 10,),
              Text('Password should be more than 6 letters and combination of numbers',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey
              )),
              const SizedBox(height: 10,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: ' Passward',
                ),
              ),
              const SizedBox(height: 15,),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Conform Passward',
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
                    RichText(text: TextSpan(
                      text: "Have an account? ",
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
