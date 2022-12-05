import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/http/productResponse.dart';
import 'package:paf_web/models/product.dart';

class ProductProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  String name = '';
  String reference = '';
  String url = '';
  bool status = false;
  String productReference = '';
  String descriptionMarket = '';
  String descriptionFeature = '';
  String descriptionadvantage = '';
  List<String> market = [];
  List<String> marketDescriptions = [];
  List<String> feature = [];
  List<String> adventage = [];

  Map<String, dynamic> data = {};

  //products list from db
  List<Product> productList = [];
  bool ascending = true;

  void load(String label, dynamic value) {
    data[label] = value;
    notifyListeners();
  }

  Future addProduct() async {
    final Map<String, dynamic> data = {};

    data['name'] = name;
    data['reference'] = reference;
    data['url_video'] = url;

    for (var i = 0; i < market.length; i++) {
      data['market${i + 1}'] = market[i];
      notifyListeners();
    }

    for (var l = 0; l < marketDescriptions.length; l++) {
      if (marketDescriptions[l] != "") {
        data['description_market${l + 1}'] = marketDescriptions[l];
        notifyListeners();
      }
    }

    for (var j = 0; j < feature.length; j++) {
      data['feature${j + 1}'] = feature[j];
      notifyListeners();
    }

    for (var k = 0; k < adventage.length; k++) {
      data['adventage${k + 1}'] = adventage[k];
      notifyListeners();
    }

    //Peticion HTTP
    final response = await PafApi.httpPost('/product/add-product', data);
    final newResponse = Product.fromMap(response);

    productList.add(newResponse);

    notifyListeners();

    return;
  }

  getProducts() async {
    final data = await PafApi.httpGet('/product/all-products');

    final productRes = ProductResponse.fromMap(data);
    productList = [...productRes.products];

    notifyListeners();
  }

  Future updateProduct(id) async {
    await PafApi.httpPut('/product/update-product/$id', data);

    productList = productList.map((e) {
      if (e.id != id) return e;

      e.id = data['id'];
      e.name = data['name'];
      e.reference = data['reference'];
      e.state = data['state'];
      e.descriptionMarket1 = data['descriptionMarket1'];
      e.observations1 = data['observations1'];
      e.descriptionMarket2 = data['descriptionMarket2'];
      e.observations2 = data['observations2'];
      e.descriptionMarket3 = data['descriptionMarket3'];
      e.observations3 = data['observations3'];
      e.descriptionMarket4 = data['descriptionMarket4'];
      e.observations4 = data['observations4'];
      e.descriptionMarket5 = data['descriptionMarket5'];
      e.observations5 = data['observations5'];
      e.feature1 = data['feature1'];
      e.observationsFeature1 = data['observationsFeature1'];
      e.feature2 = data['feature2'];
      e.observationsFeature2 = data['observationsFeature2'];
      e.feature3 = data['feature3'];
      e.observationsFeature3 = data['observationsFeature3'];
      e.feature4 = data['feature4'];
      e.observationsFeature4 = data['observationsFeature4'];
      e.feature5 = data['feature5'];
      e.observationsFeature5 = data['observationsFeature5'];
      e.adventage1 = data['adventage1'];
      e.observationsAdventage1 = data['observationsAdventage1'];
      e.adventage2 = data['adventage2'];
      e.observationsAdventage2 = data['observationsAdventage2'];
      e.adventage3 = data['adventage3'];
      e.observationsAdventage3 = data['observationsAdventage3'];
      e.adventage4 = data['adventage4'];
      e.observationsAdventage4 = data['observationsAdventage4'];
      e.adventage5 = data['adventage5'];
      e.observationsAdventage5 = data['observationsAdventage5'];
      e.userId = data['userId'];

      return e;
    }).toList();

    notifyListeners();
  }

  Future updateStatus(id, name, userId, status) async {
    data['name'] = name;
    data['userId'] = userId;
    data['state'] = status;

    await PafApi.httpPut('/product/update-product/$id', data);

    productList = productList.map((e) {
      if (e.id != id) return e;

      e.state = data['state'];

      return e;
    }).toList();

    notifyListeners();
  }

  Future deleteProduct(int id) async {
    await PafApi.httpDelete('/product/delete-product/$id', {});

    productList.removeWhere((product) => product.id == id);

    notifyListeners();
  }

  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  void sort<T>(Comparable<T> Function(Product product) getField) {
    productList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }
}
