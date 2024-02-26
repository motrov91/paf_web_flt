import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../inputs/custom_inputs.dart';

class ItemFeature extends StatelessWidget {
  final field;
  final featureData;
  final featureObservation;
  final labelText;
  final fieldObservation;

  const ItemFeature({
    super.key,
    required this.featureData,
    required this.featureObservation,
    required this.labelText,
    required this.field,
    this.fieldObservation,
  });

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;
    return Column(
      children: [
        TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El nombre del producto debe ser obligatorio';
              }

              prod.load(field, value);

              return null;
            },
            maxLines: 3,
            initialValue: featureData,
            decoration: CustomsInputs.featureUpdateInput(labelText: labelText)),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            maxLines: 3,
            initialValue: (featureObservation == "")
                ? 'Agregue un comentario a esta caracteristica'
                : featureObservation,
            enabled: (user != null)
                ? (user.rolId != 1)
                    ? false
                    : true
                : true,
            style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            validator: (value) {
              if (value == null) {
                return 'El nombre del producto debe ser obligatorio';
              }

              prod.load(fieldObservation, value);

              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Agrege comentarios a la carateristica",
                counterStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ))),
      ],
    );
  }
}
