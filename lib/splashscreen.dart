import 'dart:async';

import 'package:flutter/material.dart';
import 'package:land/Auth/login_screen.dart';
import 'package:land/provider/lands_provider.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<LandsProvider>(context, listen: false).allLands();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => const LoginPage()),
      );
    });

    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/land.jpeg',
          height: 100,
          width: 100,
        ),
      ),
    );
  }
}
