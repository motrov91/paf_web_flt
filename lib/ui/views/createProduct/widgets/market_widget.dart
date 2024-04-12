import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../buttons/custom_outlined_button.dart';

class MarketWidget extends StatefulWidget {
  const MarketWidget({super.key});

  @override
  State<MarketWidget> createState() => _MarketWidgetState();
}

class _MarketWidgetState extends State<MarketWidget> {
  String market = '';
  String description = '';

  final TextEditingController _textController = TextEditingController();
  final Set<String> dictionary = {'hello', 'world', 'flutter', 'example'};

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
                          value: 'TODOS LOS MERCADOS',
                          child: Text('TODOS LOS MERCADOS')),
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
                      //controller: fieldText,
                      controller: _textController,
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
                    child: Row(
                      children: [
                        MaterialButton(onPressed: (){
                          _validateText();
                        },
                        child: Text('prueba'),
                        ),
                        CustomOutlinedButton(
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
                      ],
                    ),
                  ),
                  const SizedBox(height: 10)
                ],
              ),
            ),
          ],
        ),
        (product.market.isEmpty == true)
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffef9a9a),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: const [
                    Text(
                      'Aún no se ha agregado ningun mercado al producto, debe agregar al menos un mercado',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              )
            : Container(
                width: 1000,
                height: 260,
                padding: const EdgeInsets.all(30),
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: product.market.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Container(
                          width: 300,
                          height: 250,
                          margin: const EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xfff6f6f6),
                              borderRadius: BorderRadius.circular(13)),
                          child: Stack(
                            children: [
                              Positioned(
                                  right: 0,
                                  top: 3,
                                  child: IconButton(
                                    icon: const Icon(
                                      Icons.highlight_off,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      product.deleteMarket(index);
                                    },
                                  )),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 30, right: 10, left: 10),
                                    child: Text(
                                      product.market[index],
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    width: 250,
                                    margin: const EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: Text(
                                      product.marketDescriptions[index],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )))
      ],
    );
  }

  void _validateText() {
    final text = _textController.text;
    print('TEXT $text');
    final words = text.split(' ');

    for (final word in words) {
      if (!dictionary.contains(word.toLowerCase())) {
        _suggestCorrection(word);
      }
    }
  }

  void _suggestCorrection(String misspelledWord) {
    // Aquí puedes implementar lógica para sugerir una corrección para la palabra mal escrita
    // Por simplicidad, esta implementación sugiere una palabra aleatoria del diccionario
    final List<String> suggestions = dictionary.toList();
    suggestions.shuffle(); // Mezclar las palabras del diccionario
    final suggestedWord = suggestions.first;

    _showCorrectionDialog(misspelledWord, suggestedWord);
  }

  void _showCorrectionDialog(String misspelledWord, String suggestedWord) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Palabra mal escrita'),
          content: Text('Quisiste decir: $suggestedWord en lugar de ${misspelledWord}?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

