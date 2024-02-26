import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

import '../../../buttons/custom_outlined_button.dart';

class Features extends StatefulWidget {
  const Features({super.key});

  @override
  State<Features> createState() => _FeaturesState();
}

class _FeaturesState extends State<Features> {
  final fieldText = TextEditingController();
  String featureDesc = "";

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        TextFormField(
            controller: fieldText,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            maxLength: 254,
            // validator: (value) {
            //   if (value == null || value.isEmpty) {
            //     return "El campo no puede estar vácio";
            //   }
            //   return null;
            // },
            onChanged: (value) => featureDesc = value,
            decoration: InputDecoration(
                labelText: 'Agrege una carácteristica',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                focusColor: Colors.white)),
        Center(
            child: CustomOutlinedButton(
                isFilled: true,
                color: Colors.blue,
                text: 'Agregar carácteristica',
                onPressed: () {
                  if (product.features.length < 5) {
                    if (featureDesc.isEmpty) {
                      return false;
                    } else {
                      product.addFeatureDescription(featureDesc);
                      clearText();
                      setState(() {
                        featureDesc = "";
                      });
                    }
                  } else {
                    return false;
                  }
                })),
        const SizedBox(height: 10),
        (product.features.isEmpty == true)
            ? Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                    color: const Color(0xffef9a9a),
                    borderRadius: BorderRadius.circular(10)),
                child: const Column(
                  children: [
                    Text(
                      'Aún no se ha agregado ninguna caracteristica al producto, debes agregar cinco caracteresticas al producto',
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
                    itemCount: product.features.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => _BuildFeature(
                          position: index,
                        ))),
        const SizedBox(height: 10)
      ],
    );
  }
}

class _BuildFeature extends StatelessWidget {
  final int position;

  const _BuildFeature({
    required this.position,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Container(
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
                  product.deleteFeature(position);
                },
              )),
          Positioned(
            bottom: 0,
            left: 5,
            child: Text(
              'Carácteristica ${position + 1}',
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
                margin: const EdgeInsets.only(top: 50, right: 10, left: 10),
                child: Text(
                  product.features[position],
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
    );
  }
}
