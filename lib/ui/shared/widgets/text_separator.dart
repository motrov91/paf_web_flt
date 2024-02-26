import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextSeparator extends StatelessWidget {
  final String text;

  const TextSeparator({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      margin: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: GoogleFonts.roboto(
            fontSize: 12,
            color: const Color(0xff6d757f),
            fontWeight: FontWeight.bold 
          ),
      ),
    );
  }
}
