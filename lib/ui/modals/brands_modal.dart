import 'package:flutter/material.dart';
import 'package:paf_web/models/brand.dart';
import 'package:paf_web/models/user.dart';
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

  @override
  void initState() {
    super.initState();

    initialVal = "Seleccione un usuario";

    id = widget.data?.id.toString();
    brand = widget.data?.brand ?? '';
    userId = widget.data?.userId.toString() ?? '';

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
                  },
                  onChanged: (value) {
                    brand = value;
                  },
                ),
                SizedBox(
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
                            borderSide: const BorderSide(color: Colors.white)),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.account_box_outlined,
                          color: Colors.white,
                        )),
                    items: users.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
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
                    final brandProvider =
                        Provider.of<BrandProvider>(context, listen: false);

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
          )
        ],
      ),
    );
  }

  BoxDecoration buildDecoration() => BoxDecoration(
      color: Color(0xff3069af),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
