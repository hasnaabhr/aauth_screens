import 'package:authscreen/constants.dart';
import 'package:authscreen/services/authentication.dart';
import 'package:authscreen/views/forgot_password_view.dart';
import 'package:authscreen/views/home_view.dart';
import 'package:authscreen/views/signup_view.dart';
import 'package:authscreen/widget/custom_elevatedbutton.dart';
import 'package:authscreen/widget/custom_text_field.dart';
import 'package:authscreen/widget/login&register_using.dart';
import 'package:authscreen/widget/snackbar.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().loginUser(
        email: emailController.text, password: passwordController.text);

    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the home screen
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } else {
      setState(() {
        isLoading = false;
      });
      // show error
      showSnackBar(context, res);
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
                "Welcome\nBack!",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.w700,
                  fontSize: 36,
                ),
              ),
              const SizedBox(height: 36),
              TextFieldInput(
                textEditingController: emailController,
                hintText: "Username or Email",
                textInputType: TextInputType.emailAddress,
                icon: Icons.person,
                // isEmail: true,
              ),
              const SizedBox(height: 16),
              TextFieldInput(
                textEditingController: passwordController,
                hintText: "Password",
                textInputType: TextInputType.visiblePassword,
                icon: Icons.lock_outline_sharp,
                isPass: true,
              ),
              const SizedBox(height: 9),
              Align(
                alignment: Alignment.topRight,
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ForgotPasswordView()));
                  },
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kPrimeColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 52),
              CustomElevatedButton(
                text: "Login",
                onTap: () {
                  loginUser(); // Make sure to call the method here
                },
              ),
              const SizedBox(height: 50),
              LoginandRegisterUsing(
                text: "Sign Up",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignupView(),
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
