import 'package:flutter/material.dart';
import 'package:vernon_edu/pages/home/home_page.dart';

import 'package:vernon_edu/pages/splash/splash_screen_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
