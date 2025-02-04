import 'package:authscreen/constants.dart';
import 'package:flutter/material.dart';

class AccountCreationText extends StatelessWidget {
  const AccountCreationText({
    super.key,
    required this.text,
    this.onTap,
  });
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Create An Account",
          style: TextStyle(
            color: Color(0xff575757),
            fontWeight: FontWeight.w400,
            fontSize: 18,
            fontFamily: "Montserrat",
          ),
        ),
        const SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            text,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              decorationStyle: TextDecorationStyle.solid,
              color: kPrimeColor,
              decorationColor: kPrimeColor,
              fontWeight: FontWeight.w600,
              fontSize: 18,
              fontFamily: "Montserrat",
            ),
          ),
        ),
      ],
    );
  }
}
