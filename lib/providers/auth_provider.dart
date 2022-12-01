import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/http/authResponse.dart';
import 'package:paf_web/models/user.dart';
import 'package:paf_web/router/router.dart';
import 'package:paf_web/services/local_storage.dart';
import 'package:paf_web/services/navigation_service.dart';
import 'package:paf_web/services/notifications_service.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider with ChangeNotifier {
  String? _token;
  AuthStatus authStatus = AuthStatus.checking;
  User? user;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //Peticion http
    final data = {"email": email, "password": password};

    PafApi.httpPost('/auth/login', data).then((json) {
      final authResponse = AuthResponse.fromMap(json);

      user = authResponse.userData;

      LocalStorage.prefs.setString('token', authResponse.token);
      authStatus = AuthStatus.authenticated;
      NavigationService.replaceTo(Flurorouter.dashboardRoute);

      //Send configureDio because i have a new JWT and i want to that a new JWT are in all petitions
      PafApi.configureDio();

      notifyListeners();
    }).catchError((e) {
      print('ERROR $e');
      NotificationsService.showSnackbarError('Email / Contraseña no válido');
    });
  }

  Future<bool> isAuthenticated() async {
    final token = LocalStorage.prefs.getString('token');

    if (token == null) {
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //Ir al backend y comprobar si el JWT es válido
    try {
      final resp = await PafApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(resp);
      LocalStorage.prefs.setString('token', authResponse.token);

      user = authResponse.userData;
      authStatus = AuthStatus.authenticated;
      notifyListeners();
      return true;
    } catch (e) {
      print('Error en la verificacion del token de acceso $e');
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();

      return false;
    }
  }

  //Cerrar sesión
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.navigateTo(Flurorouter.loginRouter);
    notifyListeners();
  }
}
