import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Welcome to\n Authentic!',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 34,
              color: Colors.black,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
