import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_management/UI/utils/assets_path.dart';
import 'package:task_management/UI/widgets/screen_backround.dart';

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
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginPage()));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenBackround(child: Center(
            child: SvgPicture.asset(AssetPath.logoPathSvg,
              height: 50,
            ),
          )
      ),
      );

  }
}
