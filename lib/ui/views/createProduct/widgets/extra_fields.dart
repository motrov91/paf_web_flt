import 'package:flutter/material.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ExtraFields extends StatelessWidget {
  const ExtraFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context, listen: false);

    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Campos para agregar información adiciona a la infografía',
            style: TextStyle(fontSize: 18, color: Colors.grey[600]),
          ),
          const SizedBox(
            height: 40,
          ),
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
              onChanged: (value) {
                product.videoExtra1 = value;
              },
              decoration: InputDecoration(
                  labelText: 'Video adicional 1',
                  hintText: 'Ingrese la url del video',
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.grey.withOpacity(0.5))),
                  focusColor: Colors.white)),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          const _urlExtra(
            numberLink: 1,
          ),
          const SizedBox(
            height: 5,
          ),
          const _urlExtra(
            numberLink: 2,
          ),
          const SizedBox(
            height: 5,
          ),
          const _urlExtra(
            numberLink: 3,
          ),
        ],
      ),
    );
  }
}

class _urlExtra extends StatelessWidget {
  const _urlExtra({
    super.key,
    required this.numberLink,
  });

  final int numberLink;

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductProvider>(context);

    return Row(
      children: [
        Expanded(
          child: TextFormField(
              keyboardType: TextInputType.multiline,
              onChanged: (value) {
                if (numberLink == 1) {
                  product.etiquetaEnlace1 = value;
                } else if (numberLink == 2) {
                  product.etiquetaEnlace2 = value;
                } else {
                  product.etiquetaEnlace3 = value;
                }
              },
              decoration: InputDecoration(
                  labelText: 'Etiqueta del enlace',
                  hintText: 'La etiqueta podrá visualizarla en la infografía',
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
              keyboardType: TextInputType.url,
              
              onChanged: (value) {
                if (numberLink == 1 && value.isNotEmpty) {
                  product.urlExtra1 = value;
                } else if (numberLink == 2) {
                  product.urlExtra2 = value;
                } else {
                  product.urlExtra3 = value;
                }
              },
              decoration: InputDecoration(
                  labelText: 'Enlace',
                  hintText: 'Enlace al que desea redireccionar',
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
