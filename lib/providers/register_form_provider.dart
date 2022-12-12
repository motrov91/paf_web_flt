import 'package:flutter/material.dart';

class RegisterFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String name = '';
  String email = '';
  String password = '';
  String repeat_password = '';
  String cargo = '';
  String rolId = '';

  set setName(String value) {
    name = value;
    notifyListeners();
  }

  validateForm() {
    if (formKey.currentState!.validate()) {
      //print('$name - $email - $password - $repeat_password - $cargo - $rolId');
      return true;
    } else {
      //print('invalid form');
      return false;
    }
  }
}
