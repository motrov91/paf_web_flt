import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../buttons/custom_outlined_button.dart';

class MarketWidgetAdd extends StatefulWidget {
  const MarketWidgetAdd({super.key});

  @override
  State<MarketWidgetAdd> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidgetAdd> {
  String market = '';
  String description = '';

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  DropdownButtonFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Este campo es obligatorio';
                      }
                      return null;
                    },
                    hint: const Text('Seleccione los mercados'),
                    items: const [
                      DropdownMenuItem(
                          value: 'INDUSTRIA QUÍMICA',
                          child: Text('INDUSTRIA QUÍMICA')),
                      DropdownMenuItem(
                          value: 'PROCESOS INDUSTRIALES',
                          child: Text('PROCESOS INDUSTRIALES')),
                      DropdownMenuItem(
                          value: 'ACUEDUCTOS', child: Text('ACUEDUCTOS')),
                      DropdownMenuItem(
                          value: 'EDUCACIÓN', child: Text('EDUCACIÓN')),
                      DropdownMenuItem(
                          value: 'ALIMENTOS', child: Text('ALIMENTOS')),
                      DropdownMenuItem(
                          value: 'GOBIERNO', child: Text('GOBIERNO')),
                      DropdownMenuItem(
                          value: 'INVESTIGACIÓN', child: Text('INVESTIGACIÓN')),
                      DropdownMenuItem(
                          value: 'CLINICO Y HOSPITALARIO',
                          child: Text('CLINICO Y HOSPITALARIO')),
                      DropdownMenuItem(
                          value: 'TRATAMIENTO DE AGUA INDUSTRIAL',
                          child: Text('TRATAMIENTO DE AGUA INDUSTRIAL')),
                      DropdownMenuItem(
                          value: 'FARMACÉUTICA', child: Text('FARMACÉUTICA')),
                      DropdownMenuItem(
                          value: 'CANNABIS', child: Text('CANNABIS')),
                    ],
                    onChanged: (String? value) => market = value!,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                          )),
                      enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xffbdbdbd))),
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                      controller: fieldText,
                      keyboardType: TextInputType.multiline,
                      maxLines: 2,
                      maxLength: 254,
                      // validator: (value) {
                      //   if (value == null || value.isEmpty) {
                      //     return 'Este campo es obligatorio';
                      //   }
                      //   return null;
                      // },
                      onChanged: (value) => description = value,
                      decoration: InputDecoration(
                          hintText: "Descripción del mercado",
                          labelText: 'Descripción',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(3),
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.grey.withOpacity(0.5))),
                          focusColor: Colors.white)),
                  Center(
                    child: CustomOutlinedButton(
                        isFilled: true,
                        color: Colors.blue,
                        text: 'Agregar Mercado',
                        onPressed: () => market.isEmpty || description.isEmpty
                            ? false
                            : {
                                product.addMarket(market),
                                product.addDescriptionMarket(description),
                                clearText(),
                                setState(() {
                                  market = "";
                                  description = "";
                                })
                              }),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
