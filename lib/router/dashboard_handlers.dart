import 'package:fluro/fluro.dart';
import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/ui/views/brand_view.dart';
import 'package:paf_web/ui/views/categories_view.dart';
import 'package:paf_web/ui/views/createProduct/createProduct.dart';
import 'package:paf_web/ui/views/product_view.dart';
import 'package:paf_web/ui/views/productsByCategory.dart';
import 'package:paf_web/ui/views/users_views.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/views/dashboardView/dashboard_view.dart';
import 'package:paf_web/ui/views/login_view.dart';

class DashboardHandlers {
  static Handler dashboard = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const DashboardView();
    } else {
      return const LoginView();
    }
  });

  static Handler users = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.usersRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const UsersView();
    } else {
      return const LoginView();
    }
  });

  static Handler brands = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.brandsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const BrandView();
    } else {
      return const LoginView();
    }
  });

  static Handler classifications = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.classificationsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const CategoriesView();
    } else {
      return const LoginView();
    }
  });

  static Handler products = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.productsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const ProductView();
    } else {
      return const LoginView();
    }
  });

  static Handler createProducts = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.productsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      return const CreateProduct();
    } else {
      return const LoginView();
    }
  });

  static Handler productsByCategory =
      Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.classificationsRoute);

    if (authProvider.authStatus == AuthStatus.authenticated) {
      if (parameters['id']?.first != null) {
        return ProductByCategory(
          id: int.parse(parameters['id']!.first),
        );
      }
    } else {
      return const LoginView();
    }
    return null;
  });
}
