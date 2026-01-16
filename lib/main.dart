import 'package:flutter/material.dart';
import 'package:vernon_edu/pages/splash/splash_screen_page.dart';
import 'package:vernon_edu/widgets/detail_class/session_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(),
    );
  }
}
