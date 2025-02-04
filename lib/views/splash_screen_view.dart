import 'package:authscreen/constants.dart';
import 'package:authscreen/views/login_view.dart';
import 'package:flutter/material.dart';

class SplashScreenView extends StatefulWidget {
  const SplashScreenView({super.key});

  @override
  State<SplashScreenView> createState() => _SplashScreenViewState();
}

class _SplashScreenViewState extends State<SplashScreenView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const LoginView()));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/splash.jpg',
              width: 125,
              height: 100,
            ),
            const SizedBox(
              width: 10,
            ),
            const Text(
              "Stylish",
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'LibreCaslonText',
                  fontWeight: FontWeight.w700,
                  color: kPrimeColor),
            )
          ],
        ),
      ),
    );
  }
}
