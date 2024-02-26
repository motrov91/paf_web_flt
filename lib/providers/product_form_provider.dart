import 'package:flutter/material.dart';

class ProductFormProvider extends ChangeNotifier {
  List markets = [];
  List descriptionsMarkets = [];
  List observationsMarkets = [];
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  bool validForm() {
    return formkey.currentState!.validate();
  }
}
