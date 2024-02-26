import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:paf_web/models/brand.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';

class BrandModal extends StatefulWidget {
  final Brand? data;

  const BrandModal({super.key, this.data});

  @override
  State<BrandModal> createState() => _BrandModalState();
}

class _BrandModalState extends State<BrandModal> {
  String initialVal = 'Seleccione un usuario';

  String? id;
  String brand = '';
  String userId = '';
  String responsible = '';
  String brandImage = '';

  @override
  void initState() {
    super.initState();

    initialVal = "Seleccione un usuario";

    id = widget.data?.id.toString();
    brand = widget.data?.brand ?? '';
    userId = widget.data?.userId.toString() ?? '';
    brandImage = widget.data?.imageBrand ??
        'https://www.paf.com.co/wp-content/uploads/2022/03/Logo-paf-5-e1648091227458.png';

    Provider.of<UsersProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context).usersList;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: buildDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nueva marca',
                style: CustomLabels.h1.copyWith(color: Colors.white),
              ),
              IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(
                    Icons.close_outlined,
                    color: Colors.white,
                  ))
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 600),
            child: Form(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  widget.data == null 
                    ? _NotImage()
                    :_ImageBrand(imageB: brandImage, id: widget.data!.id),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: Column(children: [
                      TextFormField(
                        initialValue: widget.data?.brand ?? '',
                        style: const TextStyle(color: Colors.white),
                        decoration: CustomsInputs.inputDecorationRegister(
                            hint: 'Nombre de la marca',
                            label: 'Nombre',
                            icon: Icons.abc_outlined),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Ingrese su nombre';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          brand = value;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      DropdownButtonFormField(
                          dropdownColor: Colors.black.withOpacity(0.7),
                          style: const TextStyle(color: Colors.white),
                          hint: const Text(
                            'Seleccione un responsable de la marca',
                            style: TextStyle(color: Colors.white),
                          ),
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                          ),
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                  borderSide:
                                      const BorderSide(color: Colors.white)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white)),
                              labelStyle: const TextStyle(color: Colors.white),
                              prefixIcon: const Icon(
                                Icons.account_box_outlined,
                                color: Colors.white,
                              )),
                          items: users.map((e) {
                            return DropdownMenuItem(
                              value: e,
                              child: Text(e.name),
                            );
                          }).toList(),
                          onChanged: (value) {
                            initialVal = value.toString();
                            userId = value!.id.toString();
                            responsible = value.name;
                          }),
                      const SizedBox(
                        height: 10,
                      ),
                      CustomOutlinedButton(
                        onPressed: () async {
                          final brandProvider = Provider.of<BrandProvider>(
                              context,
                              listen: false);

                          try {
                            if (id == null) {
                              await brandProvider.addBrand(brand, userId);
                              NotificationsService.showSnackbarSuccess(
                                  'Marca creada correctamente');
                            } else {
                              await brandProvider.updateBrand(
                                  id!, brand, userId, responsible);
                              NotificationsService.showSnackbarSuccess(
                                  'Marca actualizada correctamente');
                            }

                            Navigator.of(context).pop();
                          } catch (e) {
                            Navigator.of(context).pop();

                            NotificationsService.showSnackbarError(
                                'No se pudo crear la Marca');
                          }
                        },
                        text: (id != null) ? 'Modificar' : 'Crear',
                        isFilled: true,
                        color: Colors.white,
                        textColor: const Color(0xff3069af),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => const BoxDecoration(
      color: Color(0xff3069af),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}

class _NotImage extends StatelessWidget {
  const _NotImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle
      ),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.image, color: Colors.grey,),
          Text(
            'Crea la marca primero para seleccionar una imagen', 
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.grey
            ),
          )
        ],
      ),

    );
  }
}

class _ImageBrand extends StatelessWidget {
  const _ImageBrand({
    super.key,
    required this.imageB,
    required this.id,
  });

  final String imageB;
  final int id;

  @override
  Widget build(BuildContext context) {
    final brandProvider = Provider.of<BrandProvider>(context);

    final image = (imageB == '')
        ? const Image(image: AssetImage('no-image.jpg'))
        : SizedBox(
            width: 130,
            height: 130,
            child: FadeInImage.assetNetwork(
                placeholder: 'loader.gif', image: imageB));

    return Container(
      width: 180,
      height: 180,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.white,
      ),
      child: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            right: 0,
            child: ClipOval(child: image),
          ),
          Positioned(
            right: 20,
            bottom: 5,
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white, width: 5)),
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
                      NotificationsService.showBussyIndicator(context);

                      // await prod.uploadImage(id,
                      // '/uploads/product/$id', file.bytes!);

                      await brandProvider.uploadImageBrand(
                          id, '/uploads/brandImage/$id', file.bytes!);

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
    );
  }
}
