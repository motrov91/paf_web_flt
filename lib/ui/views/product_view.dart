import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/products_datasource.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/services/navigation_service.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context).user;

    return products.loading
        ? const Center(
            child: SizedBox(
              width: 40,
              height: 40,
              child: CircularProgressIndicator(
                strokeWidth: 5,
              ),
            ),
          )
        : Theme(
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
                'Productos',
                style: CustomLabels.tag,
              ),
              PaginatedDataTable(
                headingRowColor: MaterialStateColor.resolveWith((states) => const Color(0xff3466ae)),
                    sortAscending: products.ascending,
                    sortColumnIndex: products.columnIndex,
                    onRowsPerPageChanged: (value) {
                      setState(() {
                        _rowsPerPage = value ?? 10;
                      });
                    },
                    rowsPerPage: _rowsPerPage,
                    header: const Text(''),
                    actions: [
                      TextButton(
                          onPressed: () {
                            products.cleanList();
                            NavigationService.navigateTo(
                                Flurorouter.createProductRoute);
                          },
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  const Color(0xff3069af))),
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
                    ],
                    columns: [
                      DataColumn(
                          label: const Expanded(
                              child: Center(child: Text('Producto', style: TextStyle(color: Colors.white)))),
                          onSort: (columnIndex, _) {
                            products.columnIndex = columnIndex;
                            products.sort((product) => product.name);
                          }),
                      const DataColumn(
                          label: Expanded(
                              child: Center(child: Text('Infografías', style: TextStyle(color: Colors.white))))),
                      const DataColumn(
                          label: Expanded(child: Center(child: Text('Estado', style: TextStyle(color: Colors.white))))),
                      const DataColumn(
                          label: Expanded(child: Center(child: Text('Tips', style: TextStyle(color: Colors.white))))),
                      DataColumn(
                        label:
                            const Expanded(child: Center(child: Text('Creador', style: TextStyle(color: Colors.white)))),
                        onSort: (columnIndex, _) {
                          products.columnIndex = columnIndex;
                          products.sort((product) => product.user.name);
                        },
                      ),
                  (user!.rolId == 1 || user.rolId == 2)
                      ? const DataColumn(
                              label: Expanded(
                              child: Center(child: Text('Info Producto', style: TextStyle(color: Colors.white)))))
                      : const DataColumn(label: Text(''))
                    ],
                    source: ProductsDTS(
                        products: products.productList, context: context),
              ),
            ],
          )),
        );
  }
}
