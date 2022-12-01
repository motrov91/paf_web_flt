import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class NavbarAvatar extends StatelessWidget {
  const NavbarAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return Row(
      children: [
        ClipOval(
          child: Container(
            width: 30,
            height: 30,
            color: Colors.blueGrey,
            //child: Image.network('https://via.placeholder.com/200x200'),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              user!.name,
              style: GoogleFonts.roboto(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                  fontSize: 12),
            ),
            Text(user.cargo,
                style: GoogleFonts.roboto(
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                    fontSize: 10))
          ],
        ),
        const SizedBox(
          width: 50,
        )
      ],
    );
  }
}
