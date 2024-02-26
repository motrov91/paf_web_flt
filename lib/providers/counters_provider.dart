import 'package:flutter/material.dart';

class CountersProvider with ChangeNotifier {
  int _quantityMarket = 1;
  int _quantityFeatures = 1;
  int _quantityAdvantages = 1;

  int get currentQuantity => _quantityMarket;

  void addQuantity() {
    if (_quantityMarket <= 11) {
      _quantityMarket = _quantityMarket + 1;
      notifyListeners();
    }
  }

  void deleteQuantity() {
    if (_quantityMarket > 1) {
      _quantityMarket = _quantityMarket - 1;
      notifyListeners();
    }
  }

  int get currentQuantityFeatures => _quantityFeatures;

  void addQuantityFeature() {
    if (_quantityFeatures <= 4) {
      _quantityFeatures = _quantityFeatures + 1;
      notifyListeners();
    }
  }

  int get currentQuantityAdvantages => _quantityAdvantages;

  void addQuantitAdvantages() {
    if (_quantityAdvantages <= 4) {
      _quantityAdvantages = _quantityAdvantages + 1;
      notifyListeners();
    }
  }

  void restartQuantity() {
    _quantityMarket = 1;
    _quantityFeatures = 1;
    _quantityAdvantages = 1;
    notifyListeners();
  }
}
