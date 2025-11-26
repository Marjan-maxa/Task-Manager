import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';

import 'forget_passward_email_varified.dart';
import 'forget_passward_varified_otp_screen.dart';

class ForgetPasswardVarifiedOtpScreen extends StatelessWidget {
  const ForgetPasswardVarifiedOtpScreen({super.key});

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
              Text('Pin Varification',
                style: Theme.of(context).textTheme.titleLarge,),
              const SizedBox(height: 10,),
              Text('A 6 digits OTP sent your email address',style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: Colors.grey
              )),
              const SizedBox(height: 10,),
              PinCodeTextField(
                length: 6,
                keyboardType: TextInputType.number,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(8),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                  inactiveColor: Colors.grey.shade300,
                  selectedColor: Colors.green
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.transparent,
                appContext: context,

              ),
              const SizedBox(height: 20,),
              FilledButton(
                  onPressed: (){

                  }, child: Icon(Icons.arrow_circle_right_outlined,size: 23,)
              ),

              Center(
                child: Column(
                  children: [
                    TextButton(onPressed: (){}, child: Text('Forget Passward?'),),
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
