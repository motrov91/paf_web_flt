import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomOutlinedButtomStateInfoProduct extends StatelessWidget {
  final bool? state;
  final Function onPressed;

  const CustomOutlinedButtomStateInfoProduct({super.key, this.state = true, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () => onPressed(),
      style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          ),
          side: MaterialStateProperty.all(const BorderSide(color: Colors.grey)),
          backgroundColor:
              MaterialStateProperty.all(Colors.blueGrey.withOpacity(0.2))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
        child: Text('Información',
            style: GoogleFonts.roboto(color: Colors.blueGrey, fontSize: 12)),
      ),
    );
  }
}
