import 'package:flutter/material.dart';

class ItemInfoMain extends StatelessWidget {
  final String title;
  final String image;

  const ItemInfoMain(
      {super.key,
      required this.title, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 20,
              height: 20,
              child: Image(
                image: AssetImage(image))
            ),
            const SizedBox( width: 20,),
            Text(title),
          ],
        ),
        
      ]),
    );
  }
}
