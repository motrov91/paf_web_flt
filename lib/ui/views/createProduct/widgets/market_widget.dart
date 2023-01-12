import 'package:flutter/material.dart';
import 'package:paf_web/providers/counters_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

class MarketWidget extends StatefulWidget {
  const MarketWidget({super.key});

  @override
  State<MarketWidget> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidget> {
  @override
  Widget build(BuildContext context) {
    final cant = Provider.of<CountersProvider>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemCount: cant.currentQuantity,
      itemBuilder: (context, index) => _DropMarket(
        i: index,
      ),
    );
  }
}

class _DropMarket extends StatefulWidget {
  final int i;

  const _DropMarket({required this.i});

  @override
  State<_DropMarket> createState() => _DropMarketState();
}

class _DropMarketState extends State<_DropMarket> {
  final productController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);

    return Column(
      children: [
        DropdownButtonFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Este campo es obligatorio';
            }
            product.marketDescriptions.add(value);
            return null;
          },
          hint: const Text('Seleccione un mercado'),
          items: const [
            DropdownMenuItem(
                value: 'INDUSTRIA QUÍMICA', child: Text('INDUSTRIA QUÍMICA')),
            DropdownMenuItem(
                value: 'PROCESOS INDUSTRIALES',
                child: Text('PROCESOS INDUSTRIALES')),
            DropdownMenuItem(value: 'ACUEDUCTOS', child: Text('ACUEDUCTOS')),
            DropdownMenuItem(value: 'EDUCACIÓN', child: Text('EDUCACIÓN')),
            DropdownMenuItem(value: 'ALIMENTOS', child: Text('ALIMENTOS')),
            DropdownMenuItem(value: 'GOBIERNO', child: Text('GOBIERNO')),
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
            DropdownMenuItem(value: 'CANNABIS', child: Text('CANNABIS')),
          ],
          onChanged: (String? value) => product.market.add(value!),
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
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            maxLength: 200,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Este campo es obligatorio';
              }
              product.marketDescriptions.add(value);
              return null;
            },
            onChanged: (value) {},
            decoration: InputDecoration(
                hintText: "Descripción del mercado",
                labelText: 'Descripción',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                focusColor: Colors.white)),
      ],
    );
  }
}
