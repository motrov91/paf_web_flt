import 'package:flutter/material.dart';
import 'package:paf_web/models/brand.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/dialogs/delete_dialog.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/modals/brands_modal.dart';
import 'package:provider/provider.dart';

class BrandsDTS extends DataTableSource {
  final List<Brand> brands;
  final BuildContext context;

  BrandsDTS(this.brands, this.context);

  @override
  DataRow getRow(int index) {
    final brand = brands[index];
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(
        child: brand.publish 
          ? IconButton(
              onPressed: (){
                final dialog = DeleteDialog(
                    id: brand.id,
                    name: brand.brand,
                    statusShow: brand.publish,
                    textHeader: "Desea modificar el estado de publicación de la marca",
                    selectedDelete: "SHOWBRAND");

                showDialog(
                  barrierColor: Colors.black26,
                  context: context,
                  builder: (_) => dialog);
              },
              icon: const Icon(Icons.check_box_rounded), color: Colors.blue,)
          : IconButton(
              onPressed: (){
                final dialog = DeleteDialog(
                    id: brand.id,
                    name: brand.brand,
                    statusShow: brand.publish,
                    textHeader: "Desea modificar el estado de publicación de la marca",
                    selectedDelete: "SHOWBRAND");

                showDialog(
                  barrierColor: Colors.black26,
                  context: context,
                  builder: (_) => dialog);
              },
              icon: const Icon(Icons.check_box_outline_blank), color: Colors.grey,)
      )),
      DataCell(Center(
        child: Text(
          brand.brand,
          style: CustomLabels.itemTableText,
        ),
      )),
      DataCell(Center(
        child: Text(
          brand.user.name,
          style: CustomLabels.itemTableText,
        ),
      )),
      DataCell((user!.rolId == 3)
          ? const Text('')
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: IconButton(
                    splashRadius: 17,
                    splashColor: Colors.blue,
                    hoverColor: Colors.blue.withOpacity(0.2),
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 16,
                      color: Colors.blue.withOpacity(0.7),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => BrandModal(
                                data: brand,
                              ));
                    },
                  ),
                ),
                Center(
                  child: IconButton(
                    splashRadius: 17,
                    splashColor: Colors.red,
                    hoverColor: Colors.red.withOpacity(0.2),
                    icon: Icon(
                      Icons.delete_outline,
                      size: 16,
                      color: Colors.red.withOpacity(0.5),
                    ),
                    onPressed: () {
                      final dialog = DeleteDialog(
                          id: brand.id,
                          name: brand.brand,
                          textHeader: "¿Desea borrar esta marca?",
                          selectedDelete: "BRAND");

                      showDialog(
                        barrierColor: Colors.black26,
                        context: context,
                        builder: (_) => dialog);
                    },
                  ),
                ),
              ],
            )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => brands.length;

  @override
  int get selectedRowCount => 0;
}
