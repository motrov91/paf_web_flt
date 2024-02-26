import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/auth_provider.dart';
import '../../../../providers/product_provider.dart';
import '../../../inputs/custom_inputs.dart';

class ItemMarket extends StatelessWidget {
  final String market;
  final String description;
  final String observation;
  final String labelTitle;
  final String labelDescription;
  final String field;
  final String fieldObservation;

  const ItemMarket({
    Key? key,
    required this.market,
    required this.description,
    required this.observation,
    required this.labelTitle,
    required this.labelDescription,
    required this.field,
    required this.fieldObservation,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
            initialValue: market,
            enabled: false,
            decoration: CustomsInputs.updateInput(
                labelText: labelTitle, color: Colors.blue)),
        const SizedBox(
          height: 10,
        ),
        TextFormField(
            initialValue: description,
            maxLines: 3,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'El campo es obligatorio';
              }

              prod.load(field, value);

              return null;
            },
            decoration: CustomsInputs.updateInput(
                labelText: labelDescription, color: Colors.blue)),
        const SizedBox(height: 10),
        TextFormField(
            maxLines: 3,
            maxLength: 300,
            enabled: (user != null)
                ? (user.rolId != 1)
                    ? false
                    : true
                : true,
            initialValue: (observation != "")
                ? observation
                : "Agregue un comentario al mercado",
            validator: (value) {
              if (value == null) {
                return 'El campo es obligatorio';
              }

              prod.load(fieldObservation, value);

              return null;
            },
            style: TextStyle(color: Colors.grey.withOpacity(0.8)),
            decoration: CustomsInputs.updateInput(
                labelText: "Observaciones", color: Colors.grey)),
      ],
    );
  }
}




// 