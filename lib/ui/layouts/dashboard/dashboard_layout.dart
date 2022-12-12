import 'package:flutter/material.dart';
import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/ui/shared/navbar.dart';
import 'package:paf_web/ui/shared/sidebar.dart';

class DashboardLayout extends StatefulWidget {
  final Widget child;

  const DashboardLayout({super.key, required this.child});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    SidebarMenuProvider.menuController = AnimationController(
      vsync: this, 
      duration: const Duration(milliseconds: 300)
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: const Color(0xffebf5fc),
        body: Stack(
          children: [
            Row(
              children: [
                if (size.width > 870) const Sidebar(),
                Expanded(
                  child: Column(
                    children: [
                      //navbar
                      const Navbar(),

                      //Contenedor de los views
                      Expanded(
                        child: widget.child
                      )
                    ],
                  ),
                )
              ],
            ),
            if (size.width < 870)
              AnimatedBuilder(
                animation: SidebarMenuProvider.menuController,
                builder: (context, _) => Stack(
                  children: [

                    if( SidebarMenuProvider.isOpen )
                      Opacity(
                        opacity: SidebarMenuProvider.opacity.value,
                        child: GestureDetector(
                          onTap: () => SidebarMenuProvider.closeMenu(),
                          child: Container(
                            width: size.width,
                            height: size.height,
                            color: Colors.black26,
                          ),
                        ),
                      ),

                    Transform.translate(
                      offset: Offset( SidebarMenuProvider.movement.value, 0 ),
                      child: const Sidebar(),
                    )
                  ],
                ),
              )
          ],
        ));
  }
}
