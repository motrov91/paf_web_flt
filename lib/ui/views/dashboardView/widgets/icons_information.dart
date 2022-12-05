import 'package:flutter/material.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/item_info_main.dart';
import 'package:provider/provider.dart';

class IconsInformation extends StatelessWidget {
  const IconsInformation({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final users = Provider.of<UsersProvider>(context, listen: false).usersList;
    final brand = Provider.of<BrandProvider>(context, listen: false).brandList;


    return Container(
      width: double.infinity,
      decoration: _buldBox(),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          ItemInfoMain(
              image: '/user_icon.png', title: 'Usuarios', count: (users == null) ? 0 : users.length,
          ),
          if (size.width > 641)
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
              height: 60,
            ),
          ItemInfoMain(
              image: '/marcas_icon.png',
              title: 'Marcas',
              count: (brand == null) ? 0 : brand.length),
          if (size.width > 1190)
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
              height: 60,
            ),
          const ItemInfoMain(
              image: '/products_icon.png', title: 'Productos', count: 0),
        ],
      ),
    );
  }

  BoxDecoration _buldBox() => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));
}
