import 'package:flutter/material.dart';
import 'package:paf_web/providers/auth_provider.dart';
import 'package:provider/provider.dart';
import 'package:paf_web/ui/shared/widgets/item_menu.dart';
import 'package:paf_web/ui/shared/widgets/logo.dart';
import 'package:paf_web/ui/shared/widgets/text_separator.dart';
import 'package:paf_web/services/navigation_service.dart';
import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/router/router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  //Metodo para centralizar la navegacion y el control del menú
  void navigateTo(String routeName) {
    NavigationService.replaceTo(routeName);
    SidebarMenuProvider.closeMenu();
  }

  @override
  Widget build(BuildContext context) {
    final sidebarProvider = Provider.of<SidebarMenuProvider>(context);
    final user = Provider.of<AuthProvider>(context, listen: false).user;

    return Container(
      width: 250,
      height: double.infinity,
      color: const Color(0xffebf5fc),
      child: ListView(
        physics: const ClampingScrollPhysics(),
        children: [
          const Logo(),
          //* TEXTO AMBIENTE DE PRUEBAS
          // const Center(
          //   child: Text('Ambiente de pruebas', style: TextStyle(
          //     color: Colors.red,
          //     fontWeight: FontWeight.bold,
          //     fontSize: 20
          //   ),)
          // ),
          const SizedBox(
            height: 50,
          ),
          const TextSeparator(text: 'Principal'),
          ItemMenu(
              isActive:
                  sidebarProvider.currentPage == Flurorouter.dashboardRoute,
              text: 'Dashboard',
              icon: Icons.dashboard_outlined,
              onPressed: () => navigateTo(Flurorouter.dashboardRoute)),
          const SizedBox(
            height: 10,
          ),
          (user!.rolId != 1)
              ? Container()
              : ItemMenu(
                  text: 'Usuarios',
                  icon: Icons.person_outline,
                  isActive:
                      sidebarProvider.currentPage == Flurorouter.usersRoute,
                  onPressed: () => navigateTo(Flurorouter.usersRoute)),
          const SizedBox(
            height: 10,
          ),
          ItemMenu(
              text: 'Marcas',
              icon: Icons.abc,
              isActive: sidebarProvider.currentPage == Flurorouter.brandsRoute,
              onPressed: () => navigateTo(Flurorouter.brandsRoute)),
          const SizedBox(
            height: 10,
          ),
          ItemMenu(
              text: 'Clasificaciones',
              icon: Icons.api_rounded,
              isActive: sidebarProvider.currentPage ==
                  Flurorouter.classificationsRoute,
              onPressed: () => navigateTo(Flurorouter.classificationsRoute)),
          const SizedBox(
            height: 10,
          ),
          ItemMenu(
              text: 'Productos',
              icon: Icons.adf_scanner_outlined,
              isActive:
                  sidebarProvider.currentPage == Flurorouter.productsRoute,
              onPressed: () => navigateTo(Flurorouter.productsRoute)),
          const SizedBox(
            height: 30,
          ),
          const TextSeparator(text: 'Reportes'),
          ItemMenu(
              text: 'Reportes',
              icon: Icons.bar_chart_outlined,
              isActive: false,
              onPressed: () {}),
          const SizedBox(
            height: 10,
          ),
          ItemMenu(
              text: 'Ficha clientes',
              icon: Icons.person_pin_sharp,
              isActive: false,
              onPressed: () {}),
          const SizedBox(
            height: 90,
          ),
          ItemMenu(
              text: 'Cerrar sesión',
              icon: Icons.logout_outlined,
              isActive: false,
              onPressed: () {
                Provider.of<AuthProvider>(context, listen: false).logout();
              }),
        ],
      ),
    );
  }
}
