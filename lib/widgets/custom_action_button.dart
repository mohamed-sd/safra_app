import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';

class CustomActionButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final IconData? icon;

  const CustomActionButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInUp(
      duration: const Duration(milliseconds: 500),
      child: Container(
        margin: const EdgeInsets.only(bottom: 0, left: 0, right: 0),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color:Colors.black.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius:20,
              offset: const Offset(0, -4), // الظل للأعلى
            ),
          ],
        ),
        child: ElevatedButton.icon(
          onPressed: onPressed,
          iconAlignment: IconAlignment.end,
          icon: icon != null
              ? Icon(icon, color: textColor)
              : const SizedBox(),
          label: Text(
            text,
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.w800,
              color: textColor,
            ),
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
            ),
            elevation: 3, // إلغاء ظل الـ ElevatedButton نفسه
          ),
        ),
      ),
    );
  }
}
