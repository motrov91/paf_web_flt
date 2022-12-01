import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/models/product.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class UpdateProductModal extends StatefulWidget {
  final Product product;

  const UpdateProductModal({super.key, required this.product});

  @override
  State<UpdateProductModal> createState() => _UpdateProductModalState();
}

class _UpdateProductModalState extends State<UpdateProductModal> {
  int id = 1;
  String name = "";
  String reference = "";
  bool state = false;
  String? market1 = '';
  String? descriptionMarket1 = "";
  String? observation1 = "";
  String? market2 = '';
  String? descriptionMarket2 = "";
  String? observation2 = "";
  String? market3 = '';
  String? descriptionMarket3 = "";
  String? observation3 = "";
  String? market4 = '';
  String? descriptionMarket4 = "";
  String? observation4 = "";
  String? market5 = '';
  String? descriptionMarket5 = "";
  String? observation5 = "";
  String? market6 = '';
  String? descriptionMarket6 = "";
  String? observation6 = "";
  String? market7 = '';
  String? descriptionMarket7 = "";
  String? observation7 = "";
  String? market8 = '';
  String? descriptionMarket8 = "";
  String? observation8 = "";
  String? marcket9 = '';
  String? descriptionMarket9 = "";
  String? observation9 = "";
  String? market10 = '';
  String? descriptionMarket10 = "";
  String? observation10 = "";
  String? market11 = '';
  String? descriptionMarket11 = "";
  String? observation11 = "";
  String? market12 = '';
  String? descriptionMarket12 = "";
  String? observation12 = "";
  String? feature1 = "";
  String? observationsFeature1 = "";
  String? feature2 = "";
  String? observationsFeature2 = "";
  String? feature3 = "";
  String? observationsFeature3 = "";
  String? feature4 = "";
  String? observationsFeature4 = "";
  String? feature5 = "";
  String? observationsFeature5 = "";
  String? urlVideo = "";
  String? adventage1 = "";
  String? observationsAdventage1 = "";
  String? adventage2 = "";
  String? observationsAdventage2 = "";
  String? adventage3 = "";
  String? observationsAdventage3 = "";
  String? adventage4 = "";
  String? observationsAdventage4 = "";
  String? adventage5 = "";
  String? observationsAdventage5 = "";
  int userId = 1;

  @override
  void initState() {
    super.initState();
    id = widget.product.id;
    name = widget.product.name;
    reference = widget.product.reference;
    state = widget.product.state;
    market1 = widget.product.market1 ?? '';
    descriptionMarket1 = widget.product.descriptionMarket1 ?? '';
    observation1 = widget.product.observations1 ?? '';
    market2 = widget.product.market2 ?? '';
    descriptionMarket2 = widget.product.descriptionMarket2 ?? '';
    observation2 = widget.product.observations2 ?? '';
    market3 = widget.product.market3 ?? '';
    descriptionMarket3 = widget.product.descriptionMarket3 ?? '';
    observation3 = widget.product.observations3 ?? '';
    market4 = widget.product.market4 ?? '';
    descriptionMarket4 = widget.product.descriptionMarket4 ?? '';
    observation4 = widget.product.observations4 ?? '';
    market5 = widget.product.market5 ?? '';
    descriptionMarket5 = widget.product.descriptionMarket5 ?? '';
    observation5 = widget.product.observations5 ?? '';
    market6 = widget.product.market6 ?? '';
    descriptionMarket6 = widget.product.descriptionMarket6 ?? '';
    observation6 = widget.product.observations6 ?? '';
    market7 = widget.product.market7 ?? '';
    descriptionMarket7 = widget.product.descriptionMarket7 ?? '';
    observation7 = widget.product.observations7 ?? '';
    market8 = widget.product.market8 ?? '';
    descriptionMarket8 = widget.product.descriptionMarket8 ?? '';
    observation8 = widget.product.observations8 ?? '';
    marcket9 = widget.product.market9 ?? '';
    descriptionMarket9 = widget.product.descriptionMarket9 ?? '';
    observation9 = widget.product.observations9 ?? '';
    market10 = widget.product.market10 ?? '';
    descriptionMarket10 = widget.product.descriptionMarket10 ?? '';
    observation10 = widget.product.observations10 ?? '';
    market11 = widget.product.market11 ?? '';
    descriptionMarket11 = widget.product.descriptionMarket11 ?? '';
    observation11 = widget.product.observations11 ?? '';
    market12 = widget.product.market12 ?? '';
    descriptionMarket12 = widget.product.descriptionMarket12 ?? '';
    observation12 = widget.product.observations12 ?? '';
    feature1 = widget.product.feature1 ?? '';
    observationsFeature1 = widget.product.observationsFeature1 ?? '';
    feature2 = widget.product.feature2 ?? '';
    observationsFeature1 = widget.product.observationsFeature2 ?? '';
    feature3 = widget.product.feature3 ?? '';
    observationsFeature1 = widget.product.observationsFeature3 ?? '';
    feature4 = widget.product.feature4 ?? '';
    observationsFeature1 = widget.product.observationsFeature4 ?? '';
    feature5 = widget.product.feature5 ?? '';
    observationsFeature1 = widget.product.observationsFeature5 ?? '';
    urlVideo = widget.product.urlVideo ?? '';
    adventage1 = widget.product.adventage1 ?? '';
    observationsAdventage1 = widget.product.observationsAdventage1 ?? '';
    adventage2 = widget.product.adventage2 ?? '';
    observationsAdventage1 = widget.product.observationsAdventage2 ?? '';
    adventage3 = widget.product.adventage3 ?? '';
    observationsAdventage1 = widget.product.observationsAdventage3 ?? '';
    adventage4 = widget.product.adventage4 ?? '';
    observationsAdventage1 = widget.product.observationsAdventage4 ?? '';
    adventage5 = widget.product.adventage5 ?? '';
    observationsAdventage1 = widget.product.observationsAdventage5 ?? '';
    userId = widget.product.userId;
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context, listen: false);

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                offset: const Offset(0, 3),
                blurRadius: 7)
          ],
          borderRadius: BorderRadius.circular(20)),
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      margin: const EdgeInsets.symmetric(horizontal: 100, vertical: 70),
      child: SingleChildScrollView(
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Actualizar producto',
                style: CustomLabels.h1.copyWith(color: const Color(0xff3069af)),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.grey,
                  ))
            ],
          ),
          Form(
            key: prod.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    initialValue: widget.product.name,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre del producto debe ser obligatorio';
                      }

                      prod.load('name', value);

                      return null;
                    },
                    style: const TextStyle(color: Colors.grey),
                    decoration: CustomsInputs.updateInput(
                        labelText: "Producto", color: Colors.blue)),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                    initialValue: widget.product.reference,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre del producto debe ser obligatorio';
                      }

                      prod.load('reference', value);

                      return null;
                    },
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                    decoration: CustomsInputs.updateInput(
                        labelText: "Referencia", color: Colors.blue)),
                const SizedBox(
                  height: 20,
                ),
                Text('MERCADOS',
                    style: GoogleFonts.roboto(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                (market1 != "")
                    ? _ItemMarket(
                        field: 'description_market1',
                        fieldObservation: 'observations1',
                        market: market1!,
                        description: descriptionMarket1!,
                        observation: observation1!,
                        labelTitle: "Mercado 1",
                        labelDescription: "Descripción Mercado 1: ",
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                (market2 != "")
                    ? _ItemMarket(
                        field: 'description_market2',
                        fieldObservation: 'observations2',
                        market: market2!,
                        description: descriptionMarket2!,
                        observation: observation2!,
                        labelTitle: "Mercado 2",
                        labelDescription: "Descripción Mercado 2: ",
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                (market3 != "")
                    ? _ItemMarket(
                        field: 'description_market3',
                        fieldObservation: 'observations3',
                        market: market3!,
                        description: descriptionMarket3!,
                        observation: observation3!,
                        labelTitle: "Mercado 3",
                        labelDescription: "Descripción Mercado 3: ",
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                (market4 != "")
                    ? _ItemMarket(
                        field: 'description_market4',
                        fieldObservation: 'observations4',
                        market: market4!,
                        description: descriptionMarket4!,
                        observation: observation4!,
                        labelTitle: "Mercado 4",
                        labelDescription: "Descripción Mercado 4: ",
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                (market5 != "")
                    ? _ItemMarket(
                        field: 'description_market5',
                        fieldObservation: 'observations5',
                        market: market5!,
                        description: descriptionMarket5!,
                        observation: observation5!,
                        labelTitle: "Mercado 5",
                        labelDescription: "Descripción Mercado 5: ",
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                Text('CARACTERISTICAS',
                    style: GoogleFonts.roboto(
                        color: Colors.orange[800],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                (feature1 != "")
                    ? _ItemFeature(
                        labelText: "Caracteristica 1",
                        featureData: feature1,
                        featureObservation: observationsFeature1,
                        field: 'feature1',
                        fieldObservation: 'observationsFeature1',
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                (feature2 != "")
                    ? _ItemFeature(
                        labelText: "Caracteristica 2",
                        featureData: feature2,
                        featureObservation: observationsFeature2,
                        field: 'feature2',
                        fieldObservation: 'observationsFeature3',
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                (feature3 != "")
                    ? _ItemFeature(
                        labelText: "Caracteristica 3",
                        featureData: feature3,
                        featureObservation: observationsFeature3,
                        field: 'feature3',
                        fieldObservation: 'observationsFeature3',
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                (feature4 != "")
                    ? _ItemFeature(
                        labelText: "Caracteristica 4",
                        featureData: feature4,
                        featureObservation: observationsFeature4,
                        field: 'feature4',
                        fieldObservation: 'observationsFeature4',
                      )
                    : Container(),
                const SizedBox(
                  height: 15,
                ),
                const SizedBox(
                  height: 15,
                ),
                (feature5 != "")
                    ? _ItemFeature(
                        labelText: "Caracteristica 5",
                        featureData: feature5,
                        featureObservation: observationsFeature5,
                        field: 'feature5',
                        fieldObservation: 'observationsFeature5',
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                Text('URL VIDEO',
                    style: GoogleFonts.roboto(
                        color: Colors.red[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    initialValue: widget.product.urlVideo,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'El nombre del producto debe ser obligatorio';
                      }

                      prod.load('url_video', value);

                      return null;
                    },
                    style: const TextStyle(color: Colors.grey),
                    decoration: CustomsInputs.updateInput(
                        labelText: "Video URL", color: Colors.red)),
                const SizedBox(
                  height: 20,
                ),
                Text('VENTAJAS COMERCIALES',
                    style: GoogleFonts.roboto(
                        color: Colors.green[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                (adventage1 != "")
                    ? _ItemAdvantage(
                        advantageData: adventage1!,
                        observationAdventage: observationsAdventage1!,
                        labelTxt: "Ventaja 1",
                        field: 'adventage1',
                        advantagedObservation: 'observationAdventage1',
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                (adventage2 != "")
                    ? _ItemAdvantage(
                        advantageData: adventage2!,
                        observationAdventage: observationsAdventage2!,
                        labelTxt: "Ventaja 2",
                        field: 'adventage2',
                        advantagedObservation: 'observationAdventage2',
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                (adventage3 != "")
                    ? _ItemAdvantage(
                        advantageData: adventage3!,
                        observationAdventage: observationsAdventage3!,
                        labelTxt: "Ventaja 3",
                        field: 'adventage3',
                        advantagedObservation: 'observationAdventage3',
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                (adventage4 != "")
                    ? _ItemAdvantage(
                        advantageData: adventage4!,
                        observationAdventage: observationsAdventage4!,
                        labelTxt: "Ventaja 4",
                        field: 'adventage4',
                        advantagedObservation: 'observationAdventage4',
                      )
                    : Container(),
                const SizedBox(
                  height: 10,
                ),
                (adventage5 != "")
                    ? _ItemAdvantage(
                        advantageData: adventage5!,
                        observationAdventage: observationsAdventage5!,
                        labelTxt: "Ventaja 5",
                        field: 'adventage5',
                        advantagedObservation: 'observationAdventage5',
                      )
                    : Container(),
                const SizedBox(
                  height: 20,
                ),
                CustomOutlinedButton(
                  onPressed: () {
                    final isValid = prod.validateForm();
                    if (isValid) {
                      prod.load("id", id);
                      prod.load("state", false);
                      prod.load("userId", userId);
                      prod.updateProduct(id);
                    }
                    Navigator.of(context).pop();
                  },
                  text: "Actualizar",
                  isFilled: true,
                  color: Colors.blue,
                )
              ],
            ),
          )
        ]),
      ),
    );
  }
}

class _ItemMarket extends StatelessWidget {
  final String market;
  final String description;
  final String observation;
  final String labelTitle;
  final String labelDescription;
  final String field;
  final String fieldObservation;

  const _ItemMarket({
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

class _ItemFeature extends StatelessWidget {
  final field;
  final featureData;
  final featureObservation;
  final labelText;
  final fieldObservation;

  const _ItemFeature({
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

class _ItemAdvantage extends StatelessWidget {
  final String? labelTxt;
  final String advantageData;
  final String observationAdventage;
  final String field;
  final String advantagedObservation;
  const _ItemAdvantage(
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
