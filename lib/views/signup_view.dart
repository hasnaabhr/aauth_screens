import 'package:authscreen/services/authentication.dart';
import 'package:authscreen/views/home_view.dart';
import 'package:authscreen/widget/custom_text_field.dart';
import 'package:authscreen/widget/snackbar.dart';

import 'package:flutter/material.dart';

import 'package:authscreen/views/login_view.dart';
import 'package:authscreen/widget/custom_elevatedbutton.dart';
import 'package:authscreen/widget/login&register_using.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignupViewState createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
  }

  void signupUser() async {
    // set is loading to true.
    setState(() {
      isLoading = true;
    });
    // signup user using our authmethod
    String res = await AuthMethod().signupUser(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword: confirmPasswordController.text);
    // if string return is success, user has been creaded and navigate to next screen other witse show error.
    if (res == "success") {
      setState(() {
        isLoading = false;
      });
      //navigate to the next screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => const HomeView(),
      ));
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
              Text("Create an\n account",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  )),
              const SizedBox(height: 36),
              TextFieldInput(
                icon: Icons.person,
                textEditingController: emailController,
                hintText: "Username or Email",
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 31),
              TextFieldInput(
                icon: Icons.lock_outline_sharp,
                textEditingController: passwordController,
                hintText: "Password",
                textInputType: TextInputType.visiblePassword,
              ),
              TextFieldInput(
                icon: Icons.lock_outline_sharp,
                textEditingController: confirmPasswordController,
                hintText: "Confirm Password",
                textInputType: TextInputType.visiblePassword,
                isPass: true,
              ),
              const Text(
                "By clicking the Register button, you agree \n to the public offer",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff676767),
                ),
              ),
              const SizedBox(height: 30),
              CustomElevatedButton(
                text: "Sign Up",
                onTap: () {
                  signupUser();
                },
              ),
              const SizedBox(height: 40),
              LoginandRegisterUsing(
                text: "Log In",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LoginView()));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
