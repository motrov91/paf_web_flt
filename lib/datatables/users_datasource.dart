import 'package:flutter/material.dart';
import 'package:paf_web/models/user.dart';
import 'package:paf_web/ui/dialogs/delete_dialog.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/modals/user_modal.dart';

class UsersDatasource extends DataTableSource {
  final List<User> users;
  final BuildContext context;

  UsersDatasource(this.users, this.context);

  @override
  DataRow getRow(int index) {
    final user = users[index];

    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(
        user.name,
        style: CustomLabels.itemTableText,
      )),
      DataCell(Text(user.email, style: CustomLabels.itemTableText)),
      DataCell(Text(user.ciudad ?? 'Ciudad', style: CustomLabels.itemTableText)),
      DataCell(Text(user.telefono ?? 'Teléfono', style: CustomLabels.itemTableText)),
      DataCell(Text(user.cargo, style: CustomLabels.itemTableText)),
      DataCell(Row(
        children: [
          IconButton(
              splashRadius: 17,
              splashColor: Colors.blue,
              hoverColor: Colors.blue.withOpacity(0.2),
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) => UserModal(
                          user: user,
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
                  id: user.id, 
                  name: user.name,
                  textHeader: '¿Desea borrar este usuario?',
                  selectedDelete: 'USER',
                );

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
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => users.length;

  @override
  int get selectedRowCount => 0;
}
