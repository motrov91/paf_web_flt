import 'package:flutter/material.dart';
import 'package:paf_web/models/category.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:paf_web/services/notifications_service.dart';
import 'package:paf_web/ui/buttons/custom_outlined_button.dart';
import 'package:provider/provider.dart';

class AddProductCategoryModal extends StatefulWidget {
  final String productName;
  final int productId;

  const AddProductCategoryModal({
    super.key,
    required this.productName,
    required this.productId,
  });

  @override
  State<AddProductCategoryModal> createState() =>
      _AddProductCategoryModalState();
}

class _AddProductCategoryModalState extends State<AddProductCategoryModal> {
  int productIdSelected = 0;
  int? brandIdSelected;
  int? categoryIdSelected;

  @override
  void initState() {
    super.initState();
    productIdSelected = widget.productId;
  }

  @override
  Widget build(BuildContext context) {
    final brands = Provider.of<BrandProvider>(context, listen: false).brandList;
    final product = Provider.of<ProductProvider>(context, listen: false);
    final categories = Provider.of<CategoryProvider>(context);

    List<Category> category = categories.filterList;

    return Center(
      child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          width: 500,
          height: 370,
          child: Column(
            children: [
              Text(
                'Agrega el producto a una categoria.',
                style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text('Producto: ${widget.productName}'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text('Seleccione una marca:'),
              DropdownButtonFormField(
                value: brandIdSelected,
                items: brands.map((e) {
                  return DropdownMenuItem(
                      value: e.id,
                      child: Center(
                        child: Text(e.brand),
                      ));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    brandIdSelected = value;
                    categoryIdSelected = null;
                    categories.filterCategoriesByBrandId(value!);
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(height: 10),
              const Text('Seleccione una categoria:'),
//*----------------------------------------------------------------------------
              DropdownButtonFormField(
                value: categoryIdSelected,
                items: brandIdSelected == null
                    ? []
                    : category.map((e) {
                        return DropdownMenuItem(
                            value: e.id,
                            child: Center(
                              child: Text(e.name),
                            ));
                      }).toList(),
                onChanged: (value) {
                  setState(() {
                    categoryIdSelected = int.parse(value.toString());
                  });
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))),
              ),
              const SizedBox(height: 30),
              CustomOutlinedButton(
                onPressed: () async {

                  try{
                    await product.addProductToCategory(
                      categoryIdSelected!, productIdSelected);

                    NotificationsService.showSnackbarSuccess(
                        'El producto se ha agregado exitosamente a la categoria');

                    Navigator.pop(context);
                  }catch(e){
                    Navigator.pop(context);

                    NotificationsService.showSnackbarError(
                        'No se ha podido agregar el producto a la categoria, ya esta agregada a la categoria selecionada');

                  }
                  
             
                    

                    
        
                },
                text: 'Guardar',
                isFilled: true,
                color: Colors.blue,
              )
            ],
          )),
    );
  }
}
