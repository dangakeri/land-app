import 'package:flutter/material.dart';
import 'package:land/provider/lands_provider.dart';
import 'package:land/provider/make_payment_provider.dart';

import 'package:land/splashscreen.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) {
          return LandsProvider();
        }),
        ChangeNotifierProvider(create: (_) {
          return MakePaymentProvider();
        }),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
