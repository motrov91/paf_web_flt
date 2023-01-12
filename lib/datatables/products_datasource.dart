import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paf_web/models/product.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button_stateProduct.dart';
import 'package:paf_web/ui/dialogs/delete_dialog.dart';
import 'package:paf_web/ui/modals/update_product.dart';
import 'package:paf_web/ui/modals/update_status.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class ProductsDTS extends DataTableSource {
  final List<Product> products;
  final BuildContext context;

  ProductsDTS(this.products, this.context);

  @override
  DataRow getRow(int index) {
    final product = products[index];

    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Center(child: Text(product.name))),
        DataCell(Center(
            child: InkWell(
          onTap: () => launchUrl(Uri.parse(
              'https://apipafnjs-production.up.railway.app/product/product-pdf/${product.id}')),
          child: Container(
            width: 100,
            height: 25,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(30),
                color: Colors.blue.withOpacity(0.5)),
            child: const Center(
                child: Text(
              'Infografía',
              style: TextStyle(color: Colors.white),
            )),
          ),
        ))),
        DataCell((user!.rolId != 1)
            ? (product.state == false)
                ? const Center(
                    child: Text(
                    'No publicado',
                    style: TextStyle(color: Colors.red),
                  ))
                : const Center(
                    child: Text(
                    'Publicado',
                    style: TextStyle(color: Colors.green),
                  ))
            : Center(
                child: CustomOutlinedButtomStateProduct(
                  onPressed: () {
                    showCupertinoModalPopup(
                      context: context,
                      builder: (_) => UpdateStatus(product: products[index]),
                    );
                  },
                  state: product.state,
                ),
              )),
        DataCell(Center(
          child: Text(product.user.name),
        )),
        (user.rolId == 3)
            ? DataCell(Container())
            : DataCell(
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          IconButton(
            splashRadius: 13,
            onPressed: () {
              showCupertinoModalPopup(
                context: context,
                builder: (_) => UpdateProductModal(product: products[index]),
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              color: Colors.blue[300],
              size: 18,
            ),
          ),
          IconButton(
            splashRadius: 17,
            splashColor: Colors.grey,
            hoverColor: Colors.grey.withOpacity(0.2),
            onPressed: () {},
            icon: const Icon(
              Icons.view_list_outlined,
              color: Colors.grey,
              size: 18,
            ),
          ),
          IconButton(
            splashRadius: 17,
            splashColor: Colors.red,
            hoverColor: Colors.red.withOpacity(0.2),
            onPressed: () {
              final dialog = DeleteDialog(
                  id: product.id,
                  name: product.name,
                  textHeader:
                      "¿Seguro desea eliminar el producto: ${product.name}?",
                  selectedDelete: "PRODUCT");

              showDialog(
                context: context,
                builder: (context) => dialog,
              );
            },
            icon: Icon(
              Icons.delete_outline,
              color: Colors.red[300],
              size: 18,
            ),
          ),
        ])),

        
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
