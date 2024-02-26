import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/providers/counters_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/views/createProduct/widgets/advantages_widget.dart';
import 'package:paf_web/ui/views/createProduct/widgets/features_widget.dart';
import 'package:paf_web/ui/views/createProduct/widgets/market_widget.dart';
import 'package:provider/provider.dart';

import 'widgets/extra_fields.dart';

class CreateProduct extends StatelessWidget {
  const CreateProduct({super.key});

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<CountersProvider>(context, listen: false);
    final product = Provider.of<ProductProvider>(context, listen: false);

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            Text(
              'Crear producto',
              style: CustomLabels.tag,
            ),
            Container(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 5),
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Form(
                    key: product.formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Formulario para crear un producto',
                              style: CustomLabels.h1
                                  .copyWith(color: Colors.grey[600]),
                            ),
                          ),
                          const SizedBox(height: 30),
                          TextFormField(
                            onChanged: (value) => product.name = value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'El nombre del producto debe ser obligatorio';
                              }
                              return null;
                            },
                            decoration: CustomsInputs.inputDecorationLogin(
                              hint: 'Nombre del producto',
                              label: 'Nombre del producto',
                              icon: Icons.add,
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextFormField(
                            onChanged: (value) => product.reference = value,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'La referencia del producto debe ser obligatorio';
                              }
                              return null;
                            },
                            decoration: CustomsInputs.inputDecorationLogin(
                              hint: 'Referencia del producto',
                              label: 'Referencia del producto',
                              icon: Icons.add,
                            ),
                          ),
                          const SizedBox(height: 10),
                          Text('Mercados',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),

                          //* ----------------- ADD FEATURES -----------------
                          const MarketWidget(),
                          const SizedBox(height: 10),

                          //* BUTTON FOR ADD MARKETS -----------------
                          Text('Características',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500)),
                          const SizedBox(height: 10),
                          //* ----------------- ADD FEATURES -----------------
                          const Features(),
                          //* ----------------- ADD URL video -----------------
                          const SizedBox(height: 10),
                          Text('Típs comerciales',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),
                          const SizedBox(height: 10),
                          TextFormField(
                              keyboardType: TextInputType.multiline,
                              validator: (value) {
                                if (value != null) {
                                  if (value.contains('.')) {
                                    return null;
                                  } else if (value == '') {
                                    return null;
                                  } else {
                                    return 'No parece ser una url valida, verificala, en caso de no tener una URL válida, deja el campo vácio';
                                  }
                                }
                                return null;
                              },
                              onChanged: (value) => product.url = value,
                              decoration: InputDecoration(
                                  labelText: 'Video',
                                  hintText: 'Ingrese la url del video',
                                  border: OutlineInputBorder(
                                    borderSide:
                                        const BorderSide(color: Colors.white),
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey.withOpacity(0.5))),
                                  focusColor: Colors.white)),
                          //* ----------------- advantages -----------------
                          const SizedBox(height: 10),
                          Text('Ventajas competitivas',
                              style: GoogleFonts.roboto(
                                  color: Colors.grey[700],
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600)),

                          const SizedBox(height: 10),

                          //* --- Ventajas competitivas ---
                          Advantages(),
                          const SizedBox(height: 20),
                          //* --- Campos e información Extra ---
                          const ExtraFields(),

                          const SizedBox(height: 30),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomOutlinedButton(
                                  isFilled: true,
                                  text: 'Cancelar',
                                  onPressed: () {
                                    product.cleanList();
                                    Navigator.of(context).pop();
                                  },
                                  color: Colors.red),
                              const SizedBox(
                                width: 20,
                              ),
                              CustomOutlinedButton(
                                  isFilled: true,
                                  text: 'Guardar',
                                  onPressed: () async {
                                    final isValid = product.validateForm();

                                    int lengthMarket = product.market.length;
                                    int lengthDescription =
                                        product.marketDescriptions.length;

                                    int lengthFeature = product.features.length;

                                    if (lengthMarket < 1 ||
                                        lengthDescription < 1 ||
                                        lengthFeature < 1) {
                                      NotificationsService.showSnackbarError(
                                          'Debe seleccionar al menos un mercado y una carácteristica para crear este producto');
                                      return;
                                    }

                                    if (isValid) {
                                      await product.addProduct();
                                      product.cleanList();
                                      try {
                                        counter.restartQuantity();
                                        NotificationsService
                                            .showSnackbarSuccess(
                                                'Producto creado con exito');
                                        Navigator.of(context).pop();
                                      } catch (e) {
                                        Navigator.of(context).pop();
                                        NotificationsService.showSnackbarError(
                                            'No se pudo crear el producto');
                                      }
                                    }
                                  },
                                  color: Colors.green),
                            ],
                          )
                        ]),
                  ),
                ))
          ],
        ));
  }
}
