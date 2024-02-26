import 'package:flutter/material.dart';
import 'package:paf_web/models/category.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:paf_web/ui/inputs/custom_inputs.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class CategoryModal extends StatefulWidget {
  final Category? data;

  const CategoryModal({super.key, this.data});

  @override
  State<CategoryModal> createState() => _CategoryModalState();
}

class _CategoryModalState extends State<CategoryModal> {
  String initialVal = 'Seleccione una marca';

  String? id;
  String name = '';
  String brandId = '';

  @override
  void initState() {
    super.initState();

    initialVal = 'Seleccione un usuario';

    id = widget.data?.id.toString();
    name = widget.data?.name ?? '';
    brandId = widget.data?.brandId.toString() ?? '';

    Provider.of<BrandProvider>(context, listen: false).getBrands();
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context).brandList;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      decoration: buildDecoration(),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Nueva categoria',
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
                  initialValue: widget.data?.name ?? '',
                  style: const TextStyle(color: Colors.white),
                  decoration: CustomsInputs.inputDecorationRegister(
                      hint: 'Nombre de la categoria',
                      label: 'Nombre',
                      icon: Icons.abc_outlined),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Ingrese su nombre';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    name = value;
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField(
                    dropdownColor: Colors.black.withOpacity(0.7),
                    style: const TextStyle(color: Colors.white),
                    hint: const Text(
                      'Seleccione la marca a la que corresponde la categoria',
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
                    items: brands.map((e) {
                      return DropdownMenuItem(
                        value: e.id,
                        child: Text(e.brand),
                      );
                    }).toList(),
                    onChanged: (value) {
                      initialVal = value.toString();
                      brandId = value.toString();
                    }),
                const SizedBox(
                  height: 10,
                ),
                CustomOutlinedButton(
                  onPressed: () async {
                    final categoryProvider =
                        Provider.of<CategoryProvider>(context, listen: false);

                    try {
                      if (id == null) {
                        await categoryProvider.addCategoty(name, brandId);
                        NotificationsService.showSnackbarSuccess(
                            '$name creada con exito');
                      } else {
                        await categoryProvider.updateCategory(
                            id!, name, brandId);
                        NotificationsService.showSnackbarSuccess(
                            '$name actualizada exitosamente');
                      }

                      Navigator.of(context).pop();
                    } catch (e) {
                      Navigator.of(context).pop();

                      NotificationsService.showSnackbarError(
                          'No se pudo crear la clasificación');
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

  BoxDecoration buildDecoration() => const BoxDecoration(
      color: Color(0xff3069af),
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      boxShadow: [BoxShadow(color: Colors.black26)]);
}
