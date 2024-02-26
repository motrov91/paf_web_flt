import 'package:flutter/material.dart';
import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/ui/shared/widgets/navbar_avatar.dart';
import 'package:paf_web/ui/shared/widgets/notification_indicator.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;

    return SizedBox(
      height: 70,
      child: Row(
        children: [

          if(size.width <= 870 )
          ...[
              IconButton(
                onPressed: () => SidebarMenuProvider.openMenu(),
                icon: const Icon(
                  Icons.menu_outlined,
                  color: Colors.grey,
                )),
          ],

          const SizedBox(
              width: 10,
            ),

          //Search input
          // if( size.width > 670 )
          //   ConstrainedBox(
          //     constraints: const BoxConstraints(maxWidth: 400),
          //     child: const SearchText(),
          //   ),

          const Spacer(),

          const NotificationIndicator(),

          const SizedBox(
            width: 20,
          ),

          const NavbarAvatar()
        ],
      ),
    );
  }
}

//por implementar 9 - 10