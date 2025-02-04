import 'package:authscreen/views/login_view.dart';
import 'package:authscreen/widget/custom_elevatedbutton.dart';
import 'package:authscreen/widget/custom_text_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  final _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Future<void> _sendPasswordResetEmail() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Check the email to reset password and login again after reseting')),
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginView()),
      );
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(e.message ?? 'Error occurred. Please try again')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 19),
              const Text(
                "Forgot Password",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 36),
              Form(
                key: _formKey,
                child: TextFieldInput(
                  textEditingController: _emailController,
                  hintText: "Enter your email address",
                  textInputType: TextInputType.emailAddress,
                  icon: Icons.email,
                ),
              ),
              const SizedBox(height: 40),
              CustomElevatedButton(
                text: "Send Email",
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    _sendPasswordResetEmail();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
