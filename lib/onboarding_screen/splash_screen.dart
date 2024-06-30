import 'dart:async';
import 'package:clickaeventsp/onboarding_screen/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../screen/widgets/bodyBackground.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;

  changeScreen() {
    Future.delayed(const Duration(seconds: 3), () {
      auth.authStateChanges().listen((User? user) {
        if (user == null && mounted) {
          Get.to(() => const WelcomeScreen());
        } else {
          Get.to(() => const WelcomeScreen());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return BodyBackground(
      child: Stack(
        children: [
          SvgPicture.asset('assets/images/balloonebackground.svg',
              fit: BoxFit.cover,
              width: screenSize.width,
              height: screenSize.height),
          // SvgPicture.asset
          Center(
            child: SvgPicture.asset(
              'assets/images/logo.svg',
              width: 350,
              fit: BoxFit.scaleDown,
            ),
          )
        ],
      ),
    );
  }
} // Column
