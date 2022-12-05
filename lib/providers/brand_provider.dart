import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/brand.dart';
import 'package:paf_web/models/http/brandResponse.dart';
import 'package:paf_web/models/user.dart';

class BrandProvider with ChangeNotifier {
  List<Brand> brandList = [];
  bool ascending = true;

  getBrands() async {
    final data = await PafApi.httpGet('/brand/all-brand');

    final brandResp = BrandResponse.fromMap(data);

    brandList = [...brandResp.brands];

    notifyListeners();
  }

  Future addBrand(String name, String userId) async {
    final userID = int.parse(userId);

    final data = {"brand": name, "userId": userID};

    //Petición http
    final response = await PafApi.httpPost('/brand/add-brand', data);
    final newResponse = Brand.fromMap(response);

    brandList.add(newResponse);
    notifyListeners();
  }

  Future updateBrand(String id, String name, String userId, responsible) async {
    final userData = int.parse(userId);

    final data = {"id": id, "brand": name, "userId": userData};

    await PafApi.httpPut('/brand/update-brand/$id', data);

    brandList = brandList.map((e) {
      if (e.id.toString() != id) return e;

      e.brand = name;
      e.userId = int.parse(userId);
      e.user.name = responsible;

      return e;
    }).toList();

    notifyListeners();
  }

  Future deleteBrand(int id) async {
    await PafApi.httpDelete('/brand/delete-brand/$id', {});

    brandList.removeWhere((user) => user.id == id);

    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Brand brand) getField) {
    brandList.sort((a, b) {
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
