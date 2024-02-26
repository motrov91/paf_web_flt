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
  GlobalKey<FormState> formKeyRecovery = GlobalKey<FormState>();
  GlobalKey<FormState> formKeyChangePassword = GlobalKey<FormState>();

  AuthStatus authStatus = AuthStatus.checking;
  User? user;
  bool _obscurePassword = true;
  String emailRecovery = '';

  String newPassword = '';
  String repeatPassword = '';

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
      //print('Error en la verificacion del token de acceso $e');
      authStatus = AuthStatus.notAuthenticated;
      notifyListeners();

      return false;
    }
  }

  get visibilityPassword => _obscurePassword;

  void setVisibilityPassword() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  //Cerrar sesión
  logout() {
    LocalStorage.prefs.remove('token');
    authStatus = AuthStatus.notAuthenticated;
    NavigationService.replaceTo(Flurorouter.loginRouter);
    notifyListeners();
  }

  bool validFormRecovery() {
    if (formKeyRecovery.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  bool validateFormChangePassword() {
    if (newPassword == repeatPassword) {
      return true;
    } else {
      return false;
    }
  }

  //Recovery password
  recoveryPassword(String emailRecovery) {
    final data = {"emailToVerificate": emailRecovery};
    PafApi.httpPost('/auth/valitadeEmail', data).then((json) {

      NavigationService.replaceTo(Flurorouter.loginRouter);

      NotificationsService.showSnackbarSuccess(
          "Solicitud exitosa, verifica tu correo electrónico.");
    }).catchError((e) {
      //print('error recovery - $e');
      NotificationsService.showSnackbarError(
          'El correo no existe en nuestra base de datos, verificalo.');
    });
  }

  changePassword(String token) {
    final data = {"newPass": newPassword, "repeat": repeatPassword};
    PafApi.httpPost('/auth/changePassword/$token', data).then((value) {
      NavigationService.replaceTo(Flurorouter.loginRouter);
      NotificationsService.showSnackbarSuccess("Cambio de contraseña exitoso");
    }).catchError((e) {
      print(('error change password $e'));
      NavigationService.replaceTo(Flurorouter.loginRouter);
    });
  }
}
