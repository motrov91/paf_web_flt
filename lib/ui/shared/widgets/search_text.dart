import 'package:flutter/material.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';


class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _buildDecoration(),
      height: 40,
      child: TextField(
        decoration: CustomsInputs.searchInput(hint: 'Buscar producto por nombre o referencia', icon: Icons.search_outlined),
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
    color: Colors.white.withOpacity(0.5),
    borderRadius: BorderRadius.circular(10)
  );
}