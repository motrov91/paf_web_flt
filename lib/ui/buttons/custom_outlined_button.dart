import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onPressed;
  final String text;
  final Color? color;
  final bool isFilled;
  final Color textColor;
  final double? horizontalValue;
  final double? verticalValue;
  final double? fontText;

  const CustomOutlinedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.color = Colors.blueGrey,
      required this.isFilled,
      this.textColor = Colors.white, 
      this.horizontalValue = 20, 
      this.verticalValue = 10, this.fontText = 16});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))),
          side: MaterialStateProperty.all(BorderSide(color: color!)),
          backgroundColor: MaterialStateProperty.all(
              isFilled ? color!.withOpacity(0.6) : Colors.transparent)),
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: horizontalValue!, vertical: verticalValue!),
        child:
            Text(text, style: TextStyle(fontSize: fontText, color: textColor)),
      ),
    );
  }
}
