import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/models/category.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/dialogs/delete_dialog.dart';
import 'package:paf_web/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

class CategoriesDTS extends DataTableSource {
  final List<Category> categories;
  final BuildContext context;

  CategoriesDTS(this.categories, this.context);

  @override
  DataRow getRow(int index) {
    final category = categories[index];
    final user = Provider.of<AuthProvider>(context).user;

    return DataRow.byIndex(index: index, cells: [
      DataCell(Center(child: Text(category.name))),
      DataCell(Center(child: Text(category.brand.brand))),
      DataCell((user!.rolId != 1)
          ? Container()
          : Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton( 
                    splashRadius: 17,
                    splashColor: Colors.blue,
                    hoverColor: Colors.blue.withOpacity(0.2),
                    onPressed: () {
                      showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (context) => CategoryModal(
                                data: category,
                              ));
                    },
                    icon: Icon(
                      Icons.edit_outlined,
                      size: 16,
                      color: Colors.blue.withOpacity(0.7),
                    )),
                IconButton(
                    splashRadius: 17,
                    splashColor: Colors.red,
                    hoverColor: Colors.red.withOpacity(0.2),
                    onPressed: () {
                      final dialog = DeleteDialog(
                          id: category.id,
                          name: category.name,
                          textHeader: '¿Desea eliminar la clasificación?',
                          selectedDelete: "CATEGORY");

                      showDialog(
                          barrierColor: Colors.black26,
                          context: context,
                          builder: (_) => dialog);
                    },
                    icon: Icon(
                      Icons.delete_outline,
                      size: 16,
                      color: Colors.red.withOpacity(0.5),
                    )),
              ],
            )),
    ]);
  }

  @override
  // TODO: implement isRowCountApproximate
  bool get isRowCountApproximate => false;

  @override
  // TODO: implement rowCount
  int get rowCount => categories.length;

  @override
  // TODO: implement selectedRowCount
  int get selectedRowCount => 0;
}
