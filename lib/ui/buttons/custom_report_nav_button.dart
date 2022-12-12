import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomReportNavButton extends StatelessWidget {
  final String text;

  const CustomReportNavButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 30),
      alignment: Alignment.center,
      child: OutlinedButton(
        onPressed: () {},
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10)
            )
          ),
          backgroundColor: MaterialStateProperty.all(
            Colors.white
          )
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(text,
              style: GoogleFonts.roboto(
                  color: const Color(0xff000000),
                  fontWeight: FontWeight.bold,
                  fontSize: 13)),
        ),
      ),
    );
  }
}
