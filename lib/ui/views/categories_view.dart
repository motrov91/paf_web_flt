import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/categories_datasource.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/modals/category_modal.dart';
import 'package:provider/provider.dart';

class CategoriesView extends StatefulWidget {
  const CategoriesView({super.key});

  @override
  State<CategoriesView> createState() => _CategoriesViewState();
}

class _CategoriesViewState extends State<CategoriesView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<CategoryProvider>(context, listen: false).getCategories();
  }

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<CategoryProvider>(context);
    final user = Provider.of<AuthProvider>(context).user;

    return Theme(
      data: Theme.of(context).copyWith(
        cardTheme: Theme.of(context).cardTheme.copyWith(color: Colors.white),
      ),
      child: Container(
        color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: ListView(
            physics: const ClampingScrollPhysics(),
            children: [
              Text(
                'Clasificaciones',
                style: CustomLabels.tag,
              ),
              PaginatedDataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => const Color(0xff3466ae)),
                rowsPerPage: _rowsPerPage,
                sortAscending: categories.ascending,
                sortColumnIndex: categories.sortColumnIndex,
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                columns: [
                  const DataColumn(
                    label: Expanded(
                        child: Center(child: Text('Publicada', style: TextStyle(color: Colors.white),))),
                  ),
                  const DataColumn(
                      label:
                          Expanded(child: Center(child: Text('Clasificacion', style: TextStyle(color: Colors.white))))),
                  DataColumn(
                      label: const Expanded(child: Center(child: Text('Marca', style: TextStyle(color: Colors.white)))),
                      onSort: (colIndex, _) {
                        categories.sortColumnIndex = colIndex;
                        categories.sort((category) => category.brand.brand);
                      }),
                  const DataColumn(
                      label:
                          Expanded(child: Center(child: Text('Acciones', style: TextStyle(color: Colors.white))))),
                ],
                source: CategoriesDTS(categories.categoryList, context),
                header: const Text(''),
                actions: [
                  (user!.rolId != 1)
                      ? Container()
                      : TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff3069af))),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (_) => const CategoryModal(
                                data: null,
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
              )
            ],
          )),
    );
  }
}
