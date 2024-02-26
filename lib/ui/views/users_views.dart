import 'package:flutter/material.dart';
import 'package:paf_web/ui/modals/user_modal.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/users_datasource.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';

class UsersView extends StatefulWidget {
  const UsersView({super.key});

  @override
  State<UsersView> createState() => _UsersViewState();
}

class _UsersViewState extends State<UsersView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<UsersProvider>(context, listen: false).getUsers();
  }

  @override
  Widget build(BuildContext context) {
    final users = Provider.of<UsersProvider>(context);

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: Theme.of(context).cardTheme.copyWith(color: Colors.white)
      ),
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Text(
              'Usuarios',
              style: CustomLabels.tag,
            ),
            PaginatedDataTable(
              sortAscending: users.ascending,
              sortColumnIndex: users.sortColumnIndex,
              headingRowColor: MaterialStateColor.resolveWith((states) => Color(0xff3466ae)),
              columns: [
                DataColumn(
                    label: const Text('Nombre Completo', style: TextStyle(color: Colors.white)),
                    onSort: (colIndex, _) {
                      users.sortColumnIndex = colIndex;
                      users.sort<String>((user) => user.name);
                    }),
                const DataColumn(label: Text('Correo Electrónico', style: TextStyle(color: Colors.white))),
                const DataColumn(label: Text('Ciudad', style: TextStyle(color: Colors.white))),
                const DataColumn(label: Text('Cargo', style: TextStyle(color: Colors.white))),
                const DataColumn(label: Text('Acciones', style: TextStyle(color: Colors.white))),
              ],
              source: UsersDatasource(users.usersList, context),
              header: const Text(''),
              actions: [
                TextButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(const Color(0xff3069af))),
                    onPressed: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        context: context,
                        builder: (_) => const UserModal(
                          user: null,
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 14,
                        ),
                        const SizedBox(width: 3),
                        Text(
                          'Agregar',
                          style: GoogleFonts.roboto(color: Colors.white),
                        ),
                      ],
                    ))
              ],
              rowsPerPage: _rowsPerPage,
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
            )
          ],
        )),
    );
  }
}
