import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsetsGeometry.only(left: 20, right: 20),
        child: Column(
          children: [
            Image.asset('assets/images/logo_tanpa_slogan.png'),
            SvgPicture.asset('assets/images/logo_app.svg',)
          ],
        ),
      ),
    );
  }
}