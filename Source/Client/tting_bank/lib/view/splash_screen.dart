import 'package:flutter/material.dart';
import 'dart:async';
import 'package:tting_bank/view/login_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(
      Duration(seconds: 2),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => LoginPage(),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xffe3e2de),
        child: Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Container(
                child: Image.asset(
              'assets/images/im_splash_nomargin.png',
            )),
            CircularProgressIndicator(
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
