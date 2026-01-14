import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/pages/home/home_page.dart';
import 'package:vernon_edu/constants/colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/logo_tanpa_slogan.png'),
            SvgPicture.asset('assets/images/logo_app.svg'),
            SizedBox(height: 30),
            Column(
              children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Input Kode Mentor
                        Text(
                          'Kode Mentor',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColor.abuLogin,
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: CustomColor.purple,
                              ),
                              hintText: 'Masukkan Kode Mentor Anda',
                              hintStyle: TextStyle(
                                color: Color(0xFFCECFD3),
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Kode Mentor anda belum terisi';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        // Input Password
                        Text(
                          'Password',
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        SizedBox(height: 10),
                        Container(
                          padding: EdgeInsets.only(
                            left: 20,
                            right: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColor.abuLogin,
                          ),
                          child: TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: CustomColor.purple,
                              ),
                              hintText: 'Masukkan Password Anda',
                              hintStyle: TextStyle(
                                color: Color(0xFFCECFD3),
                                fontSize: 14,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                vertical: 14,
                                horizontal: 0,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: _obscureText
                                      ? Colors.grey
                                      : CustomColor.purple,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText =
                                        !_obscureText; // toggle show/hide
                                  });
                                },
                              ),
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password belum terisi';
                              }
                              return null;
                            },
                          ),
                        ),
                        SizedBox(height: 20),

                        // login button
                        InkWell(
                          borderRadius: BorderRadius.circular(10),
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(builder: (_) => HomePage()),
                                (route) => false,
                              );
                            }
                          },
                          child: Container(
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              color: CustomColor.blue,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
