import 'package:clickaeventsp/screen/main%20manu/home.dart';
import 'package:clickaeventsp/screen/main%20manu/event.dart';
import 'package:clickaeventsp/screen/main%20manu/guestsPage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:clickaeventsp/onboarding_screen/complete_profile_screen.dart';
import 'package:get/get.dart';
import 'onboarding_screen/login_screen.dart';
import 'onboarding_screen/register_screen.dart';
import 'onboarding_screen/splash_screen.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Click A Event",
      debugShowCheckedModeBanner: false,
      theme: Theme.of(context).copyWith(
        colorScheme: Theme.of(context).colorScheme.copyWith(
              primary: Colors.black,
            ),
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/login': (context) => const LoginScreen(),
        '/registerScreen': (context) => const RegisterScreen(),
        '/CompleteProfileScreen': (context) => const CompleteProfileScreen(),
        '/Event': (context) => const Event(),
        '/home': (context) => const Home(),
        '/Guests': (context) =>  const Guests(),
      },
    );
  }
}
