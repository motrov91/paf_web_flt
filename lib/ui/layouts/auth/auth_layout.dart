import 'package:flutter/material.dart';

class AuthLayout extends StatelessWidget {
  
  final Widget child;

  const AuthLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: ListView(
      children: [
        SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: child),
            ],
          )
        )
      ],
    ));
  }
}
