import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///Custom Buttom
///
///receives two paremeters [text, onPressed]
class LinkText extends StatelessWidget {
  final String text;
  final Function onPressed;

  const LinkText({super.key, required this.text, required this.onPressed,});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        // onEnter: (){},
        // onExit: (){},
        child: Container(
          alignment: Alignment.centerRight,
          child: Text(
            text,
            style: GoogleFonts.roboto(
                fontSize: 12,
                color: Colors.grey[400],
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
