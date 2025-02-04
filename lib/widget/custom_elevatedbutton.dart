import 'package:authscreen/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding:
            const EdgeInsets.only(top: 21, right: 109, bottom: 21, left: 109),
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: kPrimeColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontFamily: "Montserrat",
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.white),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
