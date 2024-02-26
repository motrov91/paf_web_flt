import 'package:fluro/fluro.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/ui/views/changePassword.dart';
import 'package:paf_web/ui/views/dashboardView/dashboard_view.dart';
import 'package:paf_web/ui/views/recoveryPassword.dart';
import 'package:paf_web/ui/views/terminos/terminos_condiciones.dart';
import 'package:paf_web/ui/views/terminos/tratamiento_datos.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/views/login_view.dart';

import '../providers/sidemenu_provider.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    Provider.of<SidebarMenuProvider>(context, listen: false)
        .setCurrentPageUrl(Flurorouter.dashboardRoute);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const LoginView();
    } else {
      return const DashboardView();
    }
  });

  static Handler recovery = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const RecoveryPassword();
    } else {
      return const DashboardView();
    }
  });

  static Handler terminosApp = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const TerminosCondiciones();
    } else {
      return const DashboardView();
    }
  });

  static Handler tratamientoDatos = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);
    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      return const TratamientoDatos();
    } else {
      return const DashboardView();
    }
  });

  static Handler changePassword = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

    if (authProvider.authStatus == AuthStatus.notAuthenticated) {
      if (parameters['token']?.first != null) {
        final data = parameters['token']!.first;
        return ChangePassword(
          token: data,
        );
      } else {
        return const LoginView();
      }
    } else {
      return const DashboardView();
    }
  });
}
