import 'package:flutter/material.dart';
import 'package:safra_app/appColors.dart';

class CustomBackButton extends StatelessWidget {
  final Color backgroundColor;
  final Color iconColor;

  const CustomBackButton({
    Key? key,
    this.backgroundColor = Colors.white,
    this.iconColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent, // حتى لا يظهر لون خلفي غير مرغوب
      child: InkWell(
        borderRadius: BorderRadius.circular(50),
        onTap: () => Navigator.of(context).maybePop(),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: Appcolors.trans,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 6,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(
            Icons.arrow_back,
            color: iconColor,
            size: 22,
          ),
        ),
      ),
    );
  }
}
