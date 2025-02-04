import 'package:authscreen/views/splash_screen_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const AuthCycle());
}

class AuthCycle extends StatelessWidget {
  const AuthCycle({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenView(),
    );
  }
}
