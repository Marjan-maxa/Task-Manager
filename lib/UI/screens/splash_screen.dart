import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_management/UI/controller/auth_controller.dart';
import 'package:task_management/UI/utils/assets_path.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';
import 'package:task_management/provider/auth_provider.dart';

import 'login_page.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    moveToNextScreen();
  }

  Future<void>moveToNextScreen()
  async {
    await Future.delayed(Duration(seconds: 3));

    final authProvider=Provider.of<AuthProvider>(context,listen: false);
    await authProvider.loadUserData();

    if(authProvider.isLoginn){
      Navigator.pushReplacementNamed(context, '/NavBar');
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackround(child: Center(
            child: Image.asset('assets/images/pen.jpg',)
          ),
      ),
      );

  }
}
