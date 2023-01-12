import 'package:fluro/fluro.dart';
import 'package:paf_web/ui/views/changePassword.dart';
import 'package:paf_web/ui/views/dashboardView/dashboard_view.dart';
import 'package:paf_web/ui/views/recoveryPassword.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/providers/auth_provider.dart';
import 'package:paf_web/ui/views/login_view.dart';

class AuthHandlers {
  static Handler login = Handler(handlerFunc: (context, parameters) {
    final authProvider = Provider.of<AuthProvider>(context!);

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
