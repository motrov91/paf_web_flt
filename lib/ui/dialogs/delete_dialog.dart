import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final id;
  final String name;
  final String textHeader;
  final String selectedDelete;

  const DeleteDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.textHeader,
      required this.selectedDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(4),
                topRight: Radius.circular(4),
              )),
          child: Center(
              child: Text(
            textHeader,
            style: GoogleFonts.roboto(color: Colors.white, fontSize: 14),
          ))),
      content: Text(
        'Una vez aceptes no podrás recuperar la información de $name',
        style: GoogleFonts.roboto(fontSize: 13),
      ),
      actions: [
        TextButton(
          child: Text(
            'Cancelar',
            style: TextStyle(color: Colors.grey[600]),
          ),
          onPressed: () {
            //Cierra el modal
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          child: Text(
            'Aceptar',
            style: TextStyle(color: Colors.red[400]),
          ),
          onPressed: () {
            if (selectedDelete == 'USER') {
              Provider.of<UsersProvider>(context, listen: false).deleteUser(id);
            }

            if (selectedDelete == 'BRAND') {
              Provider.of<BrandProvider>(context, listen: false)
                  .deleteBrand(id);
            }

            if (selectedDelete == 'CATEGORY') {
              Provider.of<CategoryProvider>(context, listen: false).deleteCategory(id);
            }

            if (selectedDelete == 'PRODUCT') {
              Provider.of<ProductProvider>(context, listen: false)
                  .deleteProduct(id);
            }

            //Cierra el modal
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
