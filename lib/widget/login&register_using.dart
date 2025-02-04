import 'package:authscreen/widget/account_creation_text.dart';
import 'package:authscreen/widget/socialmedia_badge.dart';
import 'package:flutter/material.dart';

class LoginandRegisterUsing extends StatelessWidget {
  const LoginandRegisterUsing({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "- OR Continue with -",
          style: TextStyle(
              color: Color(0xff575757),
              fontFamily: "Montserrat",
              fontSize: 20,
              fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 20),
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SocialMediaBadge(imagename: "assets/images/g.png"),
            SizedBox(width: 10),
            SocialMediaBadge(imagename: "assets/images/apple.png"),
            SizedBox(width: 10),
            SocialMediaBadge(imagename: "assets/images/facebook.png"),
          ],
        ),
        const SizedBox(
          height: 28,
        ),
        AccountCreationText(
          text: text,
          onTap: onTap,
        )
      ],
    );
  }
}
