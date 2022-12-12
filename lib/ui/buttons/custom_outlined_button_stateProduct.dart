import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButtomStateProduct extends StatelessWidget {
  final bool state;
  final Function onPressed;

  const CustomOutlinedButtomStateProduct({super.key, required this.state, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          side: MaterialStateProperty.all(BorderSide(
              color: state == false
                  ? Colors.red.withOpacity(0.2)
                  : Colors.green.withOpacity(0.2))),
          backgroundColor: MaterialStateProperty.all(
              state == false
              ? const Color(0xfffbe9e7)
              : const Color(0xffe0f2f1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text(state == false ? 'Pendiente' : 'Aprobado',
            style: GoogleFonts.roboto(
                color: state == false ? Colors.red : Colors.green,
                fontSize: 12)),
      ),
    );
  }
}
