import 'package:flutter/material.dart';

class NotificationIndicator extends StatelessWidget {
  const NotificationIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Icon(
          Icons.notifications_none_outlined,
          color: Color(0xff6d757f),
        ),
        Positioned(
          left: 2,
          child: Container(
            width: 5,
            height: 5,
            decoration: _buildDecoration(),
          ),
        )
      ],
    );
  }

  BoxDecoration _buildDecoration() => const BoxDecoration(
    color: Colors.red,
    shape: BoxShape.circle
  );
}