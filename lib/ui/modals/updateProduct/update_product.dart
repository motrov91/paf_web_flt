import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/models/product.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
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
  String name = '';
  String img = '';
  String reference = '';
  String videoExtra1 = '';
  String enlace1 = '';
  String enlace2 = '';
  String enlace3 = '';
  String label1 = '';
  String label2 = '';
  String label3 = '';

  String url = '';
  int id = 0;
  int userId = 0;

  @override
  void initState() {
    super.initState();

    id = widget.product.id;
    img = widget.product.img ?? '';
    name = widget.product.name;
    reference = widget.product.reference;
    url = widget.product.urlVideo;
    userId = widget.product.userId;
    videoExtra1 = widget.product.videoExtra1 ?? '';
    enlace1 = widget.product.urlExtra1 ?? '';
    enlace2 = widget.product.urlExtra2 ?? '';
    enlace3 = widget.product.urlExtra3 ?? '';
    label1 = widget.product.etiquetaEnlace1 ?? '';
    label2 = widget.product.etiquetaEnlace2 ?? '';
    label3 = widget.product.etiquetaEnlace3 ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductProvider>(context);

    final image = (img == '')
        ? const Image(image: AssetImage('no-image.jpg'))
        : SizedBox(
            width: 130,
            height: 130,
            child: FadeInImage.assetNetwork(
                placeholder: 'loader.gif', image: img));

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
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 130,
                      child: Stack(
                        children: [
                          ClipOval(child: image),
                          Positioned(
                            right: 20,
                            bottom: 5,
                            child: Container(
                              width: 35,
                              height: 35,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  border: Border.all(
                                      color: Colors.white, width: 5)),
                              child: FloatingActionButton(
                                backgroundColor: const Color(0xff3069af),
                                elevation: 0,
                                onPressed: () async {
                                  FilePickerResult? result =
                                      await FilePicker.platform.pickFiles(
                                    allowMultiple: false,
                                  );

                                  if (result != null) {
                                    PlatformFile file = result.files.first;

                                    final extensionFile = file.extension;

                                    if (extensionFile == 'jpg' ||
                                        extensionFile == 'png' ||
                                        extensionFile == 'jpeg') {
                                      if (!mounted) return;

                                      NotificationsService.showBussyIndicator(
                                          context);

                                      await prod.uploadImage(id,
                                          '/uploads/product/$id', file.bytes!);

                                      Navigator.of(context).pop();
                                    } else {
                                      Navigator.of(context).pop();
                                      return NotificationsService.showSnackbarError(
                                          'La extensión de la imagen no es valida');
                                    }
                                  }

                                  Navigator.of(context).pop();
                                },
                                child: const Icon(
                                  Icons.camera_alt_outlined,
                                  size: 18,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
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
                              initialValue: reference,
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
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                Text('MERCADOS',
                    style: GoogleFonts.roboto(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(height: 10),
                //* ------ ADD MARKET ---------------
                _AddMarket(),
                //* ---------------------------------
                const SizedBox(height: 20),
                Text('CARÁCTERISTICAS',
                    style: GoogleFonts.roboto(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(height: 10),
                //* ------ ADD FEATURES ---------------
                _Features(),
                //* ---------------------------------
                const SizedBox(height: 20),

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
                  style: const TextStyle(color: Colors.grey),
                  decoration: CustomsInputs.updateInput(
                      labelText: "Video URL", color: Colors.red),
                  onChanged: (value) => prod.url = value,
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
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('VENTAJAS COMERCIALES',
                    style: GoogleFonts.roboto(
                        color: Colors.green[600],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 10,
                ),

                _Adventages(),

                const SizedBox(
                  height: 20,
                ),

                Text('Información Adicional',
                    style: GoogleFonts.roboto(
                        color: Colors.red[300],
                        fontWeight: FontWeight.w500,
                        fontSize: 18)),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  initialValue: videoExtra1,
                  style: const TextStyle(color: Colors.grey),
                  decoration: CustomsInputs.updateInput(
                      labelText: "Video Adicional", color: Colors.red),
                  onChanged: (value) => prod.url = value,
                  validator: (value) {
                    if (value != null) {
                      if (value.contains('.')) {
                        prod.load('videoExtra1', value);
                        return null;
                      } else if (value == '') {
                        prod.load('videoExtra1', value);
                        return null;
                      } else {
                        return 'No parece ser una url valida, verificala, en caso de no tener una URL válida, deja el campo vácio';
                      }
                    }

                    prod.load('videoExtra1', value);

                    return null;
                  },
                ),

                const SizedBox(
                  height: 10,
                ),

                // _urlExtra(
                //   numberExtraUrl: 1,
                //   valueUrl: enlace1,
                //   valuelabelUrl: label1,
                // ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          initialValue: label1,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            label1 = value;
                          },
                          validator: (value) {
                            if (value != null) {
                              prod.load('etiquetaEnlace1', value);
                            }

                            prod.load('etiquetaEnlace1', value);

                            return null;
                          },

                          decoration: InputDecoration(
                              labelText: 'Etiqueta 1',
                              hintText: 'Agrega el nombre de la etiqueta',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                          initialValue: enlace1,
                          keyboardType: TextInputType.url,
                          onChanged: (value) {
                            enlace1 = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Enlace 1',
                              hintText: 'Ingresa el enlace 1',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          initialValue: label2,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            label2 = value;
                          },
                          validator: (value) {
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Etiqueta 2',
                              hintText: 'Agrega el nombre de la etiqueta',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                          initialValue: enlace2,
                          keyboardType: TextInputType.url,
                          onChanged: (value) {
                            enlace2 = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Enlace 2',
                              hintText: 'Ingresa el enlace 2',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                  ],
                ),

                const SizedBox(height: 10,),

                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                          initialValue: label3,
                          keyboardType: TextInputType.multiline,
                          onChanged: (value) {
                            label3 = value;
                          },
                          validator: (value) {
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Etiqueta 3',
                              hintText: 'Agrega el nombre de la etiqueta',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                          initialValue: enlace3,
                          keyboardType: TextInputType.url,
                          onChanged: (value) {
                            enlace3 = value;
                          },
                          decoration: InputDecoration(
                              labelText: 'Enlace 3',
                              hintText: 'Ingresa el enlace 3',
                              border: OutlineInputBorder(
                                borderSide:
                                    const BorderSide(color: Colors.white),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5))),
                              focusColor: Colors.white)),
                    ),
                  ],
                ),


                const SizedBox(
                  height: 10,
                ),

                CustomOutlinedButton(
                  onPressed: () async {
                    final isValid = prod.validateForm();

                    try {
                      if (isValid) {
                        prod.load("id", id);
                        prod.load("state", false);
                        prod.load("userId", userId);
                        prod.load("img", img);
                        prod.load('etiquetaEnlace1', label1);
                        prod.load('etiquetaEnlace2', label2);
                        prod.load('etiquetaEnlace3', label3);
                        prod.load('urlExtra1', enlace1);
                        prod.load('urlExtra2', enlace2);
                        prod.load('urlExtra3', enlace3);

                        await prod.updateProduct(id);

                        //prod.updateProduct(widget.product.id);

                        NotificationsService.showSnackbarSuccess(
                            "Producto actualizado con exito");

                        if (!mounted) return;
                        Navigator.of(context).pop();
                      }
                    } catch (e) {
                      NotificationsService.showSnackbarError(
                          'No se pudo Actualizar el producto');
                      Navigator.of(context).pop();
                    }
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

class _urlExtra extends StatelessWidget {
  const _urlExtra({
    super.key,
    required this.numberExtraUrl,
    this.valueUrl,
    this.valuelabelUrl,
  });

  final numberExtraUrl;
  final valueUrl;
  final valuelabelUrl;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);
    return Row(
      children: [
        Expanded(
          child: TextFormField(
              initialValue: valuelabelUrl,
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                if (numberExtraUrl == 1) {
                  product.etiquetaEnlace1 = value;
                } else if (numberExtraUrl == 2) {
                  product.etiquetaEnlace2 = value;
                } else {
                  product.etiquetaEnlace3 = value;
                }
              },
              validator: (value) {
                if (value != null) {
                  product.load('etiquetaEnlace1', value);
                }
              },
              decoration: InputDecoration(
                  labelText: 'Etiqueta $numberExtraUrl',
                  hintText: 'Agrega el nombre de la etiqueta',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5))),
                  focusColor: Colors.white)),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          flex: 2,
          child: TextFormField(
              initialValue: valueUrl,
              keyboardType: TextInputType.url,
              onChanged: (value) {
                if (numberExtraUrl == 1) {
                  product.urlExtra1 = value;
                } else if (numberExtraUrl == 2) {
                  product.urlExtra2 = value;
                } else {
                  product.urlExtra3 = value;
                }
              },
              decoration: InputDecoration(
                  labelText: valueUrl,
                  hintText: valueUrl,
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5))),
                  focusColor: Colors.white)),
        ),
      ],
    );
  }
}

class _AddMarket extends StatefulWidget {
  @override
  State<_AddMarket> createState() => _AddMarketState();
}

class _AddMarketState extends State<_AddMarket> {
  String market = '';
  String description = '';
  String observation = '';

  final fieldText = TextEditingController();

  void clearText() {
    fieldText.clear();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Column(
      children: [
        DropdownButtonFormField(
          hint: const Text('Seleccione los mercados'),
          items: const [
            DropdownMenuItem(
                value: 'TODOS LOS MERCADOS', child: Text('TODOS LOS MERCADOS')),
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
          //onChanged: (String? value) => market = value!,
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(
                  color: Colors.white,
                )),
            enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xffbdbdbd))),
          ),
          onChanged: (value) => market = value!,
        ),
        const SizedBox(height: 10),
        TextFormField(
            controller: fieldText,
            keyboardType: TextInputType.multiline,
            maxLines: 2,
            maxLength: 254,
            onChanged: (value) => description = value,
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
        const SizedBox(height: 10),
        Center(
          child: CustomOutlinedButton(
              isFilled: true,
              color: Colors.blue,
              text: 'Agregar Mercado',
              onPressed: () => product.market.length <= 11
                  ? market.isEmpty || description.isEmpty
                      ? false
                      : {
                          product.addMarket(market),
                          product.addDescriptionMarket(description),
                          product.addObservationMarket(null),
                          clearText(),
                          setState(() {
                            market = "";
                            description = "";
                          })
                        }
                  : false),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          'Mis mercados agregados',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        const SizedBox(height: 15),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 380,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: product.market.length,
              itemBuilder: (context, position) => Container(
                    width: 280,
                    height: 370,
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          onPressed: () => product.deleteMarket(position),
                          icon: Icon(
                            Icons.cancel_rounded,
                            color: Colors.red[300],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            product.market[position],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                            maxLines: 5,
                            //initialValue: product.marketDescriptions[position],
                            controller: TextEditingController(
                                text: product.marketDescriptions[position]),
                            style: const TextStyle(fontSize: 13),
                            maxLength: 254,
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                label: const Text(
                                  'Descripción del mercado:',
                                ),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  width: 2,
                                  color: Colors.grey.withOpacity(0.1),
                                ))),
                            onChanged: (value) {
                              if (product
                                  .marketDescriptions[position].isNotEmpty) {
                                product.marketDescriptions[position] = value;
                              }
                            }),
                        const SizedBox(
                          height: 10,
                        ),
                        TextField(
                          maxLines: 5,
                          controller: TextEditingController(
                              text: product.marketObservations[position] ??
                                  'No tiene ningún comentario.'),
                          style: const TextStyle(fontSize: 13),
                          maxLength: 254,
                          onChanged: (value) {
                            if (value.isEmpty ||
                                value == 'No tiene ningún comentario.') {
                              product.marketObservations[position] = null;
                            } else {
                              product.marketObservations[position] = value;
                            }
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              label: const Text(
                                'Observaciones del mercado:',
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                width: 2,
                                color: Colors.grey.withOpacity(0.1),
                              ))),
                        ),
                      ],
                    ),
                  )),
        ),
      ],
    );
  }
}

class _Features extends StatelessWidget {
  int maxLines = 3;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    List<Widget> featuresList = List.generate(5, (index) {
      return Column(children: [
        const SizedBox(height: 10),
        TextFormField(
          initialValue: product.features[index] ?? '',
          maxLines: maxLines,
          maxLength: 254,
          onChanged: (value) => product.features[index] = value,
          decoration: InputDecoration(
              hintText: "Carácteristica ${index + 1}",
              labelText: 'Carácteristica ${index + 1}',
              labelStyle: TextStyle(color: Colors.grey[300]),
              hintStyle: TextStyle(color: Colors.grey[300]),
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              focusColor: Colors.white),
        ),
        TextFormField(
            initialValue: product.featuresObservations[index] ?? '',
            maxLines: maxLines,
            maxLength: 254,
            onChanged: (value) => product.featuresObservations[index] = value,
            decoration: InputDecoration(
                hintText: "Observaciones",
                labelText: 'Observaciones de la caráctertica ${index + 1}',
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                focusColor: Colors.white))
      ]);
    });

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Mis carácteristicas agregadas',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 380,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 5,
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(children: featuresList),
          ),
        ),
      ],
    );
  }
}

class _Adventages extends StatelessWidget {
  int maxLines = 3;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    List<Widget> adventagesList = List.generate(5, (index) {
      return Column(children: [
        const SizedBox(height: 10),
        TextFormField(
          initialValue: product.adventages[index] ?? '',
          maxLines: maxLines,
          maxLength: 254,
          onChanged: (value) => product.adventages[index] = value,
          decoration: InputDecoration(
              hintText: "Ventaja comercial ${index + 1}",
              labelText: 'Ventaja ${index + 1}',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(3),
              ),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.withOpacity(0.5))),
              focusColor: Colors.white),
        ),
        TextFormField(
            initialValue: product.observationsAdventages[index] ?? '',
            maxLines: maxLines,
            maxLength: 254,
            onChanged: (value) => product.observationsAdventages[index] = value,
            decoration: InputDecoration(
                hintText: "Observación",
                labelText: 'Observaciones de la ventaja comercial ${index + 1}',
                labelStyle: TextStyle(color: Colors.grey[300]),
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(3),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: Colors.grey.withOpacity(0.5))),
                focusColor: Colors.white))
      ]);
    });

    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        Text(
          'Mis ventajas comerciales',
          style: TextStyle(color: Colors.grey[600], fontSize: 14),
        ),
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 380,
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
            vertical: 10,
          ),
          margin: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 6,
                spreadRadius: 5,
                blurStyle: BlurStyle.normal,
              )
            ],
          ),
          child: SingleChildScrollView(
            child: Column(children: adventagesList),
          ),
        ),
      ],
    );
  }
}
