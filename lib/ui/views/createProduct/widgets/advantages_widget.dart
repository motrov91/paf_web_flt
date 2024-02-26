import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../buttons/custom_outlined_button.dart';

class Advantages extends StatefulWidget {
  @override
  State<Advantages> createState() => _AdvantagesState();
}

class _AdvantagesState extends State<Advantages> {
  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    String advantageTXT = "";

    final product = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        TextFormField(
          controller: fieldText,
          keyboardType: TextInputType.multiline,
          maxLines: 2,
          maxLength: 254,
          onChanged: (value) => advantageTXT = value,
            decoration: InputDecoration(
                labelText: 'Ventaja',
                hintText: 'Agregue una ventaja de este producto',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                focusColor: Colors.white,
              prefixIcon: const Icon(Icons.trending_up_outlined),
              prefixIconColor: Colors.blue),
        ),

        Center(
          child: CustomOutlinedButton(
              isFilled: true,
              color: Colors.blue,
              text: 'Agregar ventaja competitiva',
              onPressed: () => advantageTXT.isEmpty
                  ? false
                  : {
                      product.adventages.add(advantageTXT),
                      clearText(),
                      setState(() {
                        advantageTXT = "";
                      })
                    }),
        ),
        const SizedBox(height: 10),

        (product.adventages.isEmpty == true)
          ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffef9a9a),
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    Text(
                      'Aún no se ha agregado ninguna ventaja comercial',
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
                itemCount: product.adventages.length,
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
                                  product.deleteAdventage(index);
                                },
                              )),
                          Positioned(
                            bottom: 0,
                            left: 5,
                            child: Text(
                              'Ventaja competitiva ${index + 1}',
                              style: const TextStyle(
                                fontSize: 30,
                                color: Color(0xffeeeeee),
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 50, right: 10, left: 10),
                                child: Text(
                                  product.adventages[index],
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
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
}
