import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../datatables/products_datasource.dart';
import '../../providers/auth_provider.dart';
import '../../providers/product_provider.dart';
import '../labels/custom_labels.dart';

class ProductByCategory extends StatefulWidget {
  final int id;

  const ProductByCategory({super.key, required this.id});

  @override
  State<ProductByCategory> createState() => _ProductByCategoryState();
}

class _ProductByCategoryState extends State<ProductByCategory> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  void initState() {
    super.initState();

    Provider.of<ProductProvider>(context, listen: false)
        .getProductsByIdCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductProvider>(context);
    final user = Provider.of<AuthProvider>(context).user;

    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          physics: const ClampingScrollPhysics(),
          children: [
            Text(
              'Productos por categoria',
              style: CustomLabels.tag,
            ),
            PaginatedDataTable(
              // sortAscending: products.ascending,
              // sortColumnIndex: products.columnIndex,
              onRowsPerPageChanged: (value) {
                setState(() {
                  _rowsPerPage = value ?? 10;
                });
              },
              rowsPerPage: _rowsPerPage,
              header: const Text(''),
              columns: [
                DataColumn(
                    label:
                        const Expanded(child: Center(child: Text('Producto'))),
                    onSort: (columnIndex, _) {
                      products.columnIndex = columnIndex;
                      products.sort((product) => product.name);
                    }),
                const DataColumn(
                    label: Expanded(child: Center(child: Text('Infografías')))),
                const DataColumn(
                    label: Expanded(child: Center(child: Text('Estado')))),
                const DataColumn(
                    label: Expanded(child: Center(child: Text('Tips')))),
                DataColumn(
                  label: const Expanded(child: Center(child: Text('Creador'))),
                  onSort: (columnIndex, _) {
                    products.columnIndex = columnIndex;
                    products.sort((product) => product.user.name);
                  },
                ),
                (user!.rolId != 3)
                    ? const DataColumn(
                        label: Expanded(
                            child: Center(child: Text('Info Producto'))))
                    : const DataColumn(label: Text('info'))
              ],
              source: ProductsDTS(
                  products: products.productListById,
                  context: context,
                  category: widget.id),
            ),
          ],
        ));
  }
}
