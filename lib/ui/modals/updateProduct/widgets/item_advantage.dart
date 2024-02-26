import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../inputs/custom_inputs.dart';

class ItemAdvantage extends StatelessWidget {
  final String? labelTxt;
  final String advantageData;
  final String observationAdventage;
  final String field;
  final String advantagedObservation;
  const ItemAdvantage(
      {super.key,
      this.labelTxt,
      required this.advantageData,
      required this.observationAdventage,
      required this.field,
      required this.advantagedObservation});

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return Column(
      children: [
        TextFormField(
            maxLines: 3,
            initialValue: advantageData,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El nombre del producto debe ser obligatorio';
              }

              prod.load(field, value);

              return null;
            },
            decoration:
                CustomsInputs.advantageUpdateInput(labelText: labelTxt)),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
            initialValue: (observationAdventage == "")
                ? "Agregre un comentario a esta ventaja competitiva"
                : observationAdventage,
            maxLines: 3,
            enabled: (user != null)
                ? (user.rolId != 1)
                    ? false
                    : true
                : true,
            style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            validator: (value) {
              if (value == null) {
                return 'El campo es obligatorio';
              }

              prod.load(advantagedObservation, value);

              return null;
            },
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: "Agrege comentarios a la ventaja comercial",
                counterStyle: const TextStyle(color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ))),
      ],
    );
  }
}
