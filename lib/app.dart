import 'package:flutter/material.dart';
import 'UI/screens/login_page.dart';
import 'UI/screens/splash_screen.dart';

class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
              border: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none
              ),

              fillColor:Colors.white,
              filled: true,
              hintStyle: TextStyle(
                color: Colors.grey,

              )

        ),
        textTheme: TextTheme(
          titleLarge:TextStyle(
            fontSize: 26,
            color: Colors.black,
            fontWeight: FontWeight.w600,

          ),
        ),
        filledButtonTheme: FilledButtonThemeData(

          style: FilledButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 12),
            backgroundColor: Colors.green,
            fixedSize: Size.fromWidth(double.maxFinite),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          )
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.grey
          )
        )
      ),
      home: SplashScreen(),
    );
  }
}
