// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:animated_splash_screen/animated_splash_screen.dart';

import 'login_screen.dart';
import '../my_colors.dart';

class Screen0 extends StatelessWidget {
  const Screen0({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 800,
        splashIconSize: MediaQuery.of(context).size.width * .8,
        splash: Image.network(
          "https://arc-anglerfish-arc2-prod-infobae.s3.amazonaws.com/public/FJKXKQKMMJBV7KQ7XQ3YNFO7LU.jpg",
          width: MediaQuery.of(context).size.width * .8,
          fit: BoxFit.fill,
        ),
        nextScreen: const LoginScreen(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: MyColors.trueWhite
    );
  }
}
