import 'package:flutter/material.dart';

import '../models/product.dart';

class AsesorDTS extends DataTableSource {
  final List<Product> products;
  final BuildContext context;

  AsesorDTS(this.products, this.context);

  @override
  DataRow? getRow(int index) {
    final product = products[index];

    return DataRow.byIndex(
      index: index,
      cells: const [
        DataCell(Text('info')),
        DataCell(Text('info')),
        DataCell(Text('info')),
        DataCell(Text('info')),
        DataCell(Text('info')),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => products.length;

  @override
  int get selectedRowCount => 0;
}
