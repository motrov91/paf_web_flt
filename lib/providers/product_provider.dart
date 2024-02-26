import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/http/productByIdResponse.dart';
import 'package:paf_web/models/http/productResponse.dart';
import 'package:paf_web/models/product.dart';

class ProductProvider with ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Product? product;

  Product? selected;

  bool loading = true;

  String name = '';
  String reference = '';
  String img = '';
  String url = '';
  String city = '';
  bool status = false;
  String videoExtra1 = '';
  String etiquetaEnlace1 = '';
  String urlExtra1 = '';
  String etiquetaEnlace2 = '';
  String urlExtra2 = '';
  String etiquetaEnlace3 = '';
  String urlExtra3 = '';
  List<String> market = [];
  List<String> marketDescriptions = [];
  List<dynamic> marketObservations = [];
  List<dynamic> features = [];
  List<dynamic> featuresObservations = [];
  List<dynamic> adventages = [];
  List<dynamic> observationsAdventages = [];

  Map<String, dynamic> data = {};
  ProductByIdResponse? dataProductById;

  //Set market
  void addMarket(String value) {
    if (value == 'TODOS LOS MERCADOS') {
      market.clear();
      marketDescriptions.clear();
      marketObservations.clear();
    }

    market.add(value);
    notifyListeners();
  }

  //Set descriptionMarket
  void addDescriptionMarket(String value) {
    marketDescriptions.add(value);
    notifyListeners();
  } //Set descriptionMarket

  void addObservationMarket(String? value) {
    marketObservations.add(value);
    notifyListeners();
  }

  void addFeatureDescription(String value) {
    features.add(value);
    notifyListeners();
  }

  void addFeatureObservation(String? value) {
    featuresObservations.add(value);
    notifyListeners();
  }

  //products list from db
  List<Product> productList = [];
  List<Product> productListById = [];
  bool ascending = true;
  int? columnIndex;

  void load(String label, dynamic value) {
    data[label] = value;
    notifyListeners();
  }

  void cleanList() {
    market.clear();
    marketDescriptions.clear();
    marketObservations.clear();
    features.clear();
    featuresObservations.clear();
    adventages.clear();
    observationsAdventages.clear;
    notifyListeners();
  }

  /* Elimina la posicion en la lista market esto cuando se esta creando el producto */
  void deleteMarket(int position) {
    market.removeAt(position);
    marketDescriptions.removeAt(position);
    marketObservations.removeAt(position);
    notifyListeners();
  }

  /* Elimina la posicion en la lista feature esto cuando se esta creando el producto */
  void deleteFeature(int position) {
    features.removeAt(position);
    featuresObservations.removeAt(position);
    notifyListeners();
  }

  void deleteAdventage(int position) {
    adventages.removeAt(position);
    notifyListeners();
  }

  Future addProduct() async {
    final Map<String, dynamic> data = {};
    data['name'] = name;
    data['reference'] = reference;
    data['videoExtra1'] = videoExtra1;
    data['etiquetaEnlace1'] = etiquetaEnlace1;
    data['etiquetaEnlace2'] = etiquetaEnlace2;
    data['etiquetaEnlace3'] = etiquetaEnlace3;
    data['urlExtra1'] = urlExtra1;
    data['urlExtra2'] = urlExtra2;
    data['urlExtra3'] = urlExtra3;

    if (url == '' || url.isEmpty) {
      data['url_video'] = 'https://google.com.co';
    } else {
      data['url_video'] = url;
    }

    data['markets'] = market;
    data['descriptionsMarkets'] = marketDescriptions;
    data['marketObservations'] = marketObservations;
    data['features'] = features;
    data['adventages'] = adventages;

    try {
      //Peticion HTTP
      final response = await PafApi.httpPost('/product/add-product', data);
      final newResponse = Product.fromMap(response);

      productList.add(newResponse);

      notifyListeners();

      return;
    } catch (e) {
      throw "Error al crear el producto";
    }
  }

  getProducts() async {
    final data = await PafApi.httpGet('/product/all-products');

    final productRes = ProductResponse.fromMap(data);

    productList = [...productRes.products];

    loading = false;

    notifyListeners();
  }

  Future getProductsByIdCategory(int idCategory) async {
    try {
      final data = await PafApi.httpGet('/product/all-products-id/$idCategory');

      final productRes = ProductResponse.fromMap(data);
      productListById = [...productRes.products];
      loading = false;

      notifyListeners();
    } catch (e) {
      print('eeeeee $e');
      throw "Error al obtener los productos por la categoria";
    }
  }

  Future updateProduct(id) async {
    data['markets'] = market;
    data['descriptionsMarkets'] = marketDescriptions;
    data['marketObservations'] = marketObservations;
    data['features'] = features;
    data['featuresObservations'] = featuresObservations;
    data['adventages'] = adventages;
    data['observationsAdventages'] = observationsAdventages;
    if (url == '' || url.isEmpty) {
      data['url_video'] = 'https://google.com.co';
    } else {
      data['url_video'] = url;
    }

    await PafApi.httpPut('/product/update-product/$id', data);

    productList = productList.map((e) {
      if (e.id != id) return e;

      e.name = data['name'];
      e.reference = data['reference'];
      e.state = data['state'];
      e.urlVideo = data['url_video'];
      e.videoExtra1 = data['videoExtra1'];
      e.etiquetaEnlace1 = data['etiquetaEnlace1'];
      e.etiquetaEnlace2 = data['etiquetaEnlace2'];
      e.etiquetaEnlace3 = data['etiquetaEnlace3'];
      e.urlExtra1 = data['urlExtra1'];
      e.urlExtra2 = data['urlExtra2'];
      e.urlExtra3 = data['urlExtra3'];
      e.markets = data['markets'];
      e.descriptionsMarkets = data['descriptionsMarkets'];
      e.observationsMarkets = data['marketObservations'];
      e.features = data['features'];
      e.observationsFeature = data['featuresObservations'];
      e.advantages = data['adventages'];
      e.observationsAdvantage = data['observationsAdventages'];

      return e;
    }).toList();

    notifyListeners();
  }

  Future updateStatus(id, name, userId, status) async {
    data['name'] = name;
    data['userId'] = userId;
    data['state'] = status;

    await PafApi.httpPut('/product/update-status/$id', data);

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

  Future deleteProductCategory(int? category, int? id) async {
    Map<String, dynamic> data = {};

    data['category'] = category;
    data['productId'] = id;

    await PafApi.httpDelete('/product/delete-product-category', data);

    productListById.removeWhere((product) => product.id == id);

    notifyListeners();
  }

/* Validación del formulario */
  bool validateForm() {
    if (formKey.currentState!.validate()) {
      return true;
    } else {
      return false;
    }
  }

  /// Ordenar los productos */
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

  Future<Product> uploadImage(int id, String path, Uint8List bytes) async {
    try {
      final resp = await PafApi.uploadFile(path, bytes);

      product = Product.fromMap(resp);

      productList = productList.map((e) {
        if (e.id != id) return e;

        e.img = product!.img;

        return e;
      }).toList();

      notifyListeners();

      return product!;
    } catch (e) {
      print(e);
      throw "Error en provider uploadImage $e";
    }
  }

  void searchProduct(String text) {
    productList.removeWhere((e) => e.name == text);
    notifyListeners();
  }

  Future addProductToCategory(
    int categoryId,
    int productId,
  ) async {
    final Map<String, dynamic> data = {};

    data['CategoryId'] = categoryId;
    data['ProductId'] = productId;

    try {
      await PafApi.httpPost('/product/addProductToCategory', data);
    } catch (e) {
      throw "Error al momento de asignar el producto a una categoria";
    }
  }

  Future getCotization(String reference) async {
    //print('reference: ${reference}');
    data = await PafApi.httpGet('/product/cotization/$reference');
    print(data);

    // final productRes = ProductResponse.fromMap(data);
    // productListById = [...productRes.products];
    // loading = false;

    // notifyListeners();
  }
}
