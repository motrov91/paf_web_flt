import 'package:flutter/material.dart';
import 'package:paf_web/providers/brand_provider.dart';
import 'package:paf_web/providers/category_provider.dart';
import 'package:paf_web/providers/counters_provider.dart';
import 'package:paf_web/providers/product_provider.dart';
import 'package:provider/provider.dart';

import 'package:paf_web/api/pafapi.dart';

import 'package:paf_web/router/router.dart';

import 'package:paf_web/ui/layouts/dashboard/dashboard_layout.dart';
import 'package:paf_web/ui/layouts/splash/splash_layout.dart';
import 'package:paf_web/ui/layouts/auth/auth_layout.dart';

import 'package:paf_web/providers/sidemenu_provider.dart';
import 'package:paf_web/providers/users_provider.dart';
import 'package:paf_web/providers/auth_provider.dart';

import 'package:paf_web/services/notifications_service.dart';
import 'package:paf_web/services/local_storage.dart';
import 'package:paf_web/services/navigation_service.dart';


void main() async {
  await LocalStorage.configurePrefs();
  PafApi.configureDio();
  Flurorouter.configureRoutes();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          lazy: false,
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider(
          lazy: false,
          create: ((_) => SidebarMenuProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => UsersProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => BrandProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => CategoryProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => CountersProvider()),
        ),
        ChangeNotifierProvider(
          create: ((_) => ProductProvider()),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: Flurorouter.loginRouter,
      onGenerateRoute: Flurorouter.router.generator,
      navigatorKey: NavigationService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
      builder: (_, child) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.authStatus == AuthStatus.checking)
          return SplashLayout();

        if (authProvider.authStatus == AuthStatus.authenticated) {
          return DashboardLayout(child: child!);
        } else {
          return AuthLayout(child: child!);
        }

        //
      },
    );
  }
}

// 12 - 13 implementado
