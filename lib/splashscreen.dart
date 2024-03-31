import 'dart:async';

import 'package:flutter/material.dart';
import 'package:land/Auth/login_screen.dart';
import 'package:land/screen/bottom_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // getCurreUser();
    super.initState();
  }

  navigateHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const BottomScreen(),
      ),
    );
  }

  navigateAcc() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginPage(),
      ),
    );
  }

  // getCurrentUser() {
  //   // final User? user = supabase.auth.currentUser;

  //   if (user?.aud == "authenticated") {
  //     Future.delayed(const Duration(seconds: 3), navigateHome);
  //   } else {
  //     Future.delayed(const Duration(seconds: 3), navigateAcc);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/land.jpg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
