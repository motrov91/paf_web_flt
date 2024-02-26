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

  bool validateForm(String pass, String repeat) {
    if (formKey.currentState!.validate()) {
      if (pass == repeat) {
        return true;
      } else {
        return false;
      }
    } else {
      //print('invalid form');
      return false;
    }
  }
}
