import 'package:flutter/material.dart';
import 'package:task_management/UI/screens/update_profile_screen.dart';
import 'UI/screens/login_page.dart';
import 'UI/screens/nav_bar_holder_screen.dart';
import 'UI/screens/sign_up_screen.dart';
import 'UI/screens/splash_screen.dart';

class TaskManagement extends StatelessWidget {
  const TaskManagement({super.key});

  static GlobalKey<NavigatorState>navigator=GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
      initialRoute: '/SplashScreen',
      routes: {
        '/SplashScreen':(_)=>SplashScreen(),
        '/Login':(_)=>LoginPage(),
        '/SignUp':(_)=>SingUpScreen(),
        '/NavBar':(_)=>NavBarHolderScreen(),
        '/SplashScreen':(_)=>SplashScreen(),
        '/UpdatePrfile':(_)=>UpdateProfileScreen(),
      },

    );
  }
}
