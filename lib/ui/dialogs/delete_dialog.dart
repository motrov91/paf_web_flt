import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:provider/provider.dart';

class DeleteDialog extends StatelessWidget {
  final int id;
  final int? productId;
  final bool? statusShow;
  final String name;
  final String textHeader;
  final String selectedDelete;

  const DeleteDialog(
      {super.key,
      required this.id,
      required this.name,
      required this.textHeader,
      required this.selectedDelete,
      this.productId, this.statusShow});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      titlePadding: const EdgeInsets.all(0),
      title: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
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
        selectedDelete != 'SHOWBRAND'
          ? 'Una vez aceptes cambiarás el estado de $name'
          : 'Desea cambiar el estado de la marca $name',
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
          onPressed: () async {
            switch (selectedDelete) {
              case 'USER':
                try {
                  await Provider.of<UsersProvider>(context, listen: false)
                      .deleteUser(id);
                  NotificationsService.showSnackbarSuccess(
                      "Usuario eliminado correctamente");
                } catch (e) {
                  NotificationsService.showSnackbarError(
                      "No se pudo eliminar el usuario.");
                }
                break;
              case 'BRAND':
                try {
                  await Provider.of<BrandProvider>(context, listen: false)
                      .deleteBrand(id);
                  NotificationsService.showSnackbarSuccess(
                      "Marca eliminada correctamente");
                } catch (e) {
                  NotificationsService.showSnackbarError(
                      "No se pudo elimar el usuario.");
                }
                break;
              case 'CATEGORY':
                try {
                  Provider.of<CategoryProvider>(context, listen: false)
                      .deleteCategory(id);
                  NotificationsService.showSnackbarSuccess(
                      "Categoria eliminada correctamente");
                } catch (e) {
                  NotificationsService.showSnackbarError(
                      "No se pudo eliminar la categoria");
                }
                break;
              case 'PRODUCT':
                try {
                  Provider.of<ProductProvider>(context, listen: false)
                      .deleteProduct(id);
                  NotificationsService.showSnackbarSuccess(
                      "Producto eliminado correctamente");
                } catch (e) {
                  NotificationsService.showSnackbarError(
                      "No se pudo eliminar el producto");
                }
                break;
              case 'PRODUCTCATEGORY':
                try {
                  Provider.of<ProductProvider>(context, listen: false)
                      .deleteProductCategory(id, productId);
                  NotificationsService.showSnackbarSuccess(
                      "Producto eliminado de la categoria correctamente correctamente");
                } catch (e) {
                  NotificationsService.showSnackbarError(
                      "No se pudo eliminar el producto");
                }
                break;
              case 'SHOWBRAND':
                try{
                  Provider.of<BrandProvider>(context, listen: false).updateShowStatus(id, statusShow!);
                  // NotificationsService.showSnackbarSuccess(
                  //     "Producto eliminado de la categoria correctamente correctamente");
                }catch(e){
                  print(e);
                }
                break;
              default:
                NotificationsService.showSnackbarError(
                    "No se pudo eliminar el producto");
            }

            //Cierra el modal
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
