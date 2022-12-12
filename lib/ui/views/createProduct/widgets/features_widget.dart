import 'package:flutter/material.dart';
import 'package:paf_web/providers/counters_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

class Features extends StatelessWidget {
  const Features({super.key});

  @override
  Widget build(BuildContext context) {
    final cant = Provider.of<CountersProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: cant.currentQuantityFeatures,
      itemBuilder: (context, index) => const _TextFormField(),
    );
  }
}

class _TextFormField extends StatelessWidget {
  const _TextFormField({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);

    return TextFormField(
        keyboardType: TextInputType.multiline,
        maxLines: 2,
        maxLength: 200,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "El campo no puede estar vácio";
          }
          product.feature.add(value);
          return null;
        },
        decoration: InputDecoration(
            labelText: 'Característica',
            border: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
              borderRadius: BorderRadius.circular(3),
            ),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
            focusColor: Colors.white));
  }
}
