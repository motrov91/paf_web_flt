import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';

import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:paf_web/models/product.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button_stateProduct.dart';
import 'package:paf_web/ui/dialogs/delete_dialog.dart';
import 'package:paf_web/ui/modals/add_product_to_category_modal.dart';
import 'package:paf_web/ui/modals/updateProduct/update_product.dart';
import 'package:paf_web/ui/modals/update_status.dart';

class ProductsDTS extends DataTableSource {
  final List<Product> products;
  final BuildContext context;
  final int? category;

  ProductsDTS({required this.products, required this.context, this.category});

  @override
  DataRow getRow(int index) {
    final product = products[index];

    final user = Provider.of<AuthProvider>(context, listen: false).user;

    final prod = Provider.of<ProductProvider>(context);

    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Center(child: Text(product.name))),
        DataCell(Center(
            child: InkWell(
          //Testing
          // onTap: () => launchUrl(Uri.parse(
          //     'https://apipafnjs-production-e7a0.up.railway.app/product/product-pdf/${product.id}')),
          // Producción
          onTap: () => launchUrl(Uri.parse(
              'https://apipafnjs-production.up.railway.app/product/product-pdf/${product.id}')),
          // Local
          // onTap: () => launchUrl(Uri.parse(
          // 'http://localhost:3000/product/product-pdf/${product.id}')),
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
                      builder: (_) => UpdateStatus(product: product),
                    );
                  },
                  state: product.state,
                ),
              )),
        DataCell((product.urlVideo != 'https://google.com.co')
            ? Container(
                child: CustomOutlinedButton(
                  onPressed: () => launchUrl(Uri.parse(product.urlVideo)),
                  text: 'Tips',
                  isFilled: true,
                  color: Colors.orange[100],
                  horizontalValue: 2,
                  verticalValue: 0,
                  textColor: Color(0xffFF5722),
                  fontText: 12,
                ),
              )
            : Container()),
        DataCell(Center(
          child: Text(product.user.name),
        )),
        (user.rolId != 3)
            ? DataCell(category != null
                ? Center(
                    child: IconButton(
                      splashRadius: 17,
                      splashColor: Colors.grey,
                      hoverColor: Colors.grey.withOpacity(0.2),
                      onPressed: () {
                        showCupertinoModalPopup(
                            context: context,
                            builder: (_) {
                              return DeleteDialog(
                                  productId: product.id,
                                  id: category!,
                                  name: 'este producto en esta categoria',
                                  textHeader:
                                      '¿Desea eliminar el producto de esta categoria?',
                                  selectedDelete: 'PRODUCTCATEGORY');
                            });
                      },
                      icon: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                        size: 18,
                      ),
                    ),
                  )
                : _OptionsButtons(
                    context: context,
                    prod: prod,
                    product: product,
                  ))
            : DataCell(Container())
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

class _OptionsButtons extends StatelessWidget {
  const _OptionsButtons({
    super.key,
    required this.context,
    required this.prod,
    required this.product,
  });

  final BuildContext context;
  final ProductProvider prod;
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      IconButton(
        splashRadius: 13,
        onPressed: () {
          //prod.productById(product.id);
          showCupertinoModalPopup(
              context: context,
              builder: (_) {
                prod.market = product.markets;
                prod.marketDescriptions = product.descriptionsMarkets;
                prod.marketObservations = product.observationsMarkets;
                prod.features = product.features;
                prod.featuresObservations = product.observationsFeature;
                prod.adventages = product.advantages;
                prod.observationsAdventages = product.observationsAdvantage;
                prod.videoExtra1 = product.videoExtra1 ?? '';
                return UpdateProductModal(
                  product: product,
                );
              });
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
        onPressed: () {
          showCupertinoModalPopup(
              context: context,
              builder: (_) {
                return AddProductCategoryModal(
                  productName: product.name,
                  productId: product.id,
                );
              });
        },
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
    ]);
  }
}
