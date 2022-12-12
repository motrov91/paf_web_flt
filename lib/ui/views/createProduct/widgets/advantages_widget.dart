import 'package:flutter/material.dart';
import 'package:paf_web/providers/counters_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

class Advantages extends StatelessWidget {
  const Advantages({super.key});

  @override
  Widget build(BuildContext context) {
    final cant = Provider.of<CountersProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount:
          cant.currentQuantityAdvantages, //cant.currentQuantityFeatures,
      itemBuilder: (context, index) => _TextFormFiel(),
    );
  }
}

class _TextFormFiel extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);

    return TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        maxLength: 200,
        onChanged: (value) => product.descriptionadvantage = value,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Este campo es obligatorio';
          }

          product.adventage.add(value);

          return null;
        },
        decoration: InputDecoration(
            labelText: 'Ventaja',
            hintText: 'Agregue una ventaja de este producto',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(3),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            focusColor: Colors.white));
  }
}
