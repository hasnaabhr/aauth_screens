import 'package:authscreen/constants.dart';
import 'package:flutter/material.dart';

class SocialMediaBadge extends StatelessWidget {
  const SocialMediaBadge({super.key, required this.imagename});
  final String imagename;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Colors.white,
        border: Border.all(
          color: kPrimeColor,
          width: 3,
        ),
        image: DecorationImage(
          image: AssetImage(imagename),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
