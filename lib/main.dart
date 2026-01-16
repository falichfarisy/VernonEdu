import 'package:flutter/material.dart';
import 'package:vernon_edu/pages/detail_class/attendance/attendance_page.dart';
import 'package:vernon_edu/pages/detail_class/attendance_input.dart';
import 'package:vernon_edu/pages/detail_class/detail_class_page.dart';
import 'package:vernon_edu/pages/home/beranda_page.dart';
import 'package:vernon_edu/pages/home/facilitator/facilitator_page.dart';
import 'package:vernon_edu/pages/login/login_page.dart';
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
      home: DetailClassPage(username: "Nama Pengajar", role: 'Role Pengajar',),
    );
  }
}
