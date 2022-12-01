import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/datatables/products_datasource.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/services/navigation_service.dart';
import 'package:paf_web/ui/labels/custom_labels.dart';
import 'package:provider/provider.dart';

class ProductView extends StatefulWidget {
  const ProductView({super.key});

  @override
  State<ProductView> createState() => _ProductViewState();
}

class _ProductViewState extends State<ProductView> {
  final int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();
    Provider.of<ProductProvider>(context, listen: false).getProducts();
  }

  @override
  Widget build(BuildContext context) {
    final products =
        Provider.of<ProductProvider>(context).productList;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Text(
              'Productos',
              style: CustomLabels.tag,
            ),
            PaginatedDataTable(
                rowsPerPage: _rowsPerPage,
                header: const Text(''),
                actions: [
                  TextButton(
                      onPressed: () => NavigationService.navigateTo(
                          Flurorouter.createProductRoute),
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(const Color(0xff3069af))),
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
                columns: const [
                  DataColumn(label: Expanded(
                    child: Center(child: Text('Producto'))
                  )),
                  DataColumn(label: Expanded(
                    child: Center(child: Text('Infografías'))
                  )),
                  DataColumn(label: Expanded(
                    child: Center(child: Text('Estado'))
                  )),
                  DataColumn(label: Expanded(
                    child: Center(child: Text('Creador'))
                  )),
                  DataColumn(label: Expanded(
                    child: Center(child: Text('Info Producto'))
                  )),
                ],
                source: ProductsDTS(products, context))
          ],
        ));
  }
}
