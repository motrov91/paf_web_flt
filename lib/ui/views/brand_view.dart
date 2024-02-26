import 'package:flutter/material.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:provider/provider.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/brands_datasource.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:paf_web/ui/modals/brands_modal.dart';

class BrandView extends StatefulWidget {
  const BrandView({super.key});

  @override
  State<BrandView> createState() => _BrandViewState();
}

class _BrandViewState extends State<BrandView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<BrandProvider>(context, listen: false).getBrands();
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;

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
                'Marcas',
                style: CustomLabels.tag,
              ),
              PaginatedDataTable(
                headingRowColor:  MaterialStateColor.resolveWith((states) => Color(0xff3466ae)),
                onRowsPerPageChanged: (value) {
                  setState(() {
                    _rowsPerPage = value ?? 10;
                  });
                },
                rowsPerPage: _rowsPerPage,
                sortAscending: brands.ascending,
                sortColumnIndex: brands.sortColumnIndex,
                columns: [
                  const DataColumn(
                    label: Expanded(
                        child: Center(child: Text('Publicada', style: TextStyle(color: Colors.white),))),
                  ),
                  DataColumn(
                      label: const Expanded(
                          child: Center(child: Text('Nombre marca', style: TextStyle(color: Colors.white)))),
                      onSort: (colIndex, _) {
                        brands.sortColumnIndex = colIndex;
                        brands.sort((brand) => brand.brand);
                      }),
                  DataColumn(
                      label: const Expanded(
                          child: Center(child: Text('Responsable', style: TextStyle(color: Colors.white)))),
                      onSort: (colIndex, _) {
                        brands.sortColumnIndex = colIndex;
                        brands.sort((brand) => brand.user.name);
                      }),
                  const DataColumn(
                      label: Expanded(child: Center(child: Text('Acciones', style: TextStyle(color: Colors.white))))),
                ],
                source: BrandsDTS(brands.brandList, context),
                header: const Text(''),
                actions: [
                  (user!.rolId == 1)
                      ? TextButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(
                                  const Color(0xff3069af))),
                          onPressed: () {
                            showModalBottomSheet(
                              backgroundColor: Colors.transparent,
                              context: context,
                              builder: (context) => const BrandModal(
                                data: null,
                              ),
                            );
                          },
                          child: Row(
                            children: [
                              const Icon(
                                Icons.add_outlined,
                                color: Colors.white,
                                size: 14,
                              ),
                              Text(
                                'Agregar',
                                style: GoogleFonts.roboto(color: Colors.white),
                              )
                            ],
                          ))
                      : Container()
                ],
              )
            ],
          )),
    );
  }
}
