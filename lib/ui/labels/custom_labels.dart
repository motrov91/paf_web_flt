import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomLabels {
  static TextStyle h1 =
      GoogleFonts.roboto(fontSize: 20, fontWeight: FontWeight.w400);

  static TextStyle tag = GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: const Color(0xff6d757f));

  static TextStyle tagWhite = GoogleFonts.roboto(
      fontSize: 12,
      fontWeight: FontWeight.bold,
      color: const Color(0xff003cbe));

  static TextStyle itemTableText = GoogleFonts.roboto(
      fontSize: 14,
      fontWeight: FontWeight.normal,
      color: const Color(0xff757575));

  static TextStyle productStateChecked = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: Colors.green
  );
}
