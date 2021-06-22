import 'package:calculadora_imc/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;
  final Color backgroundColor;

  const RoundedButton({
    Key key,
    @required this.onPressed,
    @required this.label,
    this.backgroundColor,
  })  : assert(label != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      child: Container(
        child: Text(
          this.label,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'Oranienbaum',
            letterSpacing: 1,
            fontSize: 18,
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        decoration: BoxDecoration(
          color: this.backgroundColor ?? AppColors.primary,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5,
            ),
          ],
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onPressed: this.onPressed,
    );
  }
}
