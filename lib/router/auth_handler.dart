import 'package:fluro/fluro.dart';
import 'package:paf_web/ui/views/dashboardView/dashboard_view.dart';
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
}
