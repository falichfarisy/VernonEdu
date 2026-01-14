import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vernon_edu/pages/home/home_page.dart';

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
                        Text('Kode Mentor'),
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
                            color: Color(0xFFF6F7FB),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              icon: Icon(Icons.person),
                              hintText: 'Masukkan Kode Mentor Anda',
                              hintStyle: TextStyle(
                                color: Color(0xFFCECFD3),
                                fontSize: 12,
                              ),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xFFCECFD3),
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
                        Text('Password'),
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
                            color: Color(0xFFF6F7FB),
                          ),
                          child: TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              icon: Icon(Icons.lock),
                              hintText: 'Masukkan Password Anda',
                              hintStyle: TextStyle(
                                color: Color(0xFFCECFD3),
                                fontSize: 12,
                              ),
                              border: InputBorder.none,
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: Colors.grey,
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
                              fontSize: 12,
                              color: Color(0xFFCECFD3),
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
                        Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(vertical: 2),
                          decoration: BoxDecoration(
                            color: Color(0xFF6AD6F8),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: GestureDetector(
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
                              width: double.infinity, // <- ini bikin full-width
                              padding: EdgeInsets.symmetric(
                                vertical: 15,
                              ), // kasih padding biar tinggi bagus
                              decoration: BoxDecoration(
                                color: Color(0xFF6AD6F8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Center(
                                // supaya teks di tengah
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