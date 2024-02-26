import 'package:flutter/material.dart';
import 'package:paf_web/ui/views/dashboardView/widgets/item_info_main.dart';

class IconsInformation extends StatelessWidget {
  const IconsInformation({super.key});


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      decoration: _buldBox(),
      child: Wrap(
        alignment: WrapAlignment.spaceBetween,
        crossAxisAlignment: WrapCrossAlignment.center,
        direction: Axis.horizontal,
        children: [
          const ItemInfoMain(
            image: '/user_icon.png',
            title: 'Usuarios',
          ),
          if (size.width > 641)
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
              height: 60,
            ),
          const ItemInfoMain(
              image: '/marcas_icon.png',
              title: 'Marcas'),
          if (size.width > 1190)
            Container(
              color: Colors.grey.withOpacity(0.1),
              width: 1,
              height: 60,
            ),
          const ItemInfoMain(
            image: '/products_icon.png',
            title: 'Productos',
          ),
        ],
      ),
    );
  }

  BoxDecoration _buldBox() => BoxDecoration(
      color: Colors.white, borderRadius: BorderRadius.circular(10));
}
