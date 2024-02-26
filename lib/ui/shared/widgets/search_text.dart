import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:provider/provider.dart';

class SearchText extends StatelessWidget {
  const SearchText({super.key});

  @override
  Widget build(BuildContext context) {
    final productSearch = Provider.of<ProductProvider>(context, listen: false);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      decoration: _buildDecoration(),
      height: 40,
      child: TextFormField(
        onChanged: (value) => productSearch.searchProduct(value),
        decoration: CustomsInputs.searchInput(
          hint: 'Buscar producto por nombre o referencia',
          icon: Icons.search_outlined,
        ),
      ),
    );
  }

  BoxDecoration _buildDecoration() => BoxDecoration(
      color: Colors.white.withOpacity(0.5),
      borderRadius: BorderRadius.circular(10));
}
