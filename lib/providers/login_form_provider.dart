import 'package:flutter/material.dart';


class LoginFormProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      //print('$email ----- $password');
      return true;
    } else {
      // print('Form not valid');
      return false;
    }
  }
}
