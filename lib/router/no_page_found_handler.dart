import 'package:fluro/fluro.dart';
import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/ui/views/no_page_found_view.dart';
import 'package:provider/provider.dart';

class NoPageFoundHandlers {
  static Handler noPageFound = Handler(handlerFunc: (context, parameters) {
    Provider.of<SidebarMenuProvider>(context!, listen: false)
        .setCurrentPageUrl('/404');

    return const NoPageFoundView();
  });
}
