import 'package:fluro/fluro.dart';

import 'package:paf_web/router/auth_handler.dart';
import 'package:paf_web/router/dashboard_handlers.dart';
import 'package:paf_web/router/no_page_found_handler.dart';

class Flurorouter {
  static final FluroRouter router = FluroRouter();

  //Auth router
  static String loginRouter = '/auth/login';

  //Dashboard
  static String dashboardRoute = '/dashboard';
  static String usersRoute = '/users';
  static String brandsRoute = '/brands';
  static String classificationsRoute = '/classifications';
  static String productsRoute = '/products';
  static String createProductRoute = '/addProducts';
  static String editProduct = '/product/editProduct';

  static void configureRoutes() {
    //Auth routes
    router.define(loginRouter, handler: AuthHandlers.login);

    //Dashboard
    router.define(dashboardRoute,
        handler: DashboardHandlers.dashboard,
        transitionType: TransitionType.fadeIn);
    router.define(usersRoute,
        handler: DashboardHandlers.users,
        transitionType: TransitionType.fadeIn);
    router.define(brandsRoute,
        handler: DashboardHandlers.brands,
        transitionType: TransitionType.fadeIn);
    router.define(classificationsRoute,
        handler: DashboardHandlers.classifications,
        transitionType: TransitionType.fadeIn);
    router.define(productsRoute,
        handler: DashboardHandlers.products,
        transitionType: TransitionType.fadeIn);
    router.define(createProductRoute,
        handler: DashboardHandlers.createProducts,
        transitionType: TransitionType.fadeIn);
    router.define(editProduct,
        handler: DashboardHandlers.updateProduct,
        transitionType: TransitionType.fadeIn);

    // 404
    router.notFoundHandler = NoPageFoundHandlers.noPageFound;
  }
}
