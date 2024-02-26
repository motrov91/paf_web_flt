import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('logo_gestion.png'),
        )
      ),
    );
  }
}