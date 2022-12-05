import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/http/categoryResponse.dart';

import '../models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> categoryList = [];
  bool ascending = true;

  getCategories() async {
    final data = await PafApi.httpGet('/category/all-categories');

    final dataResponse = CategoryResponse.fromMap(data);

    categoryList = [...dataResponse.categories];

    notifyListeners();
  }

  addCategoty(String name, String brandId) async {
    final brandID = int.tryParse(brandId);

    final data = {"name": name, "brandId": brandID};

    //Petición http
    final response = await PafApi.httpPost('/category/add-category', data);

    final newResponse = Category.fromMap(response);

    categoryList.add(newResponse);

    notifyListeners();
  }

  Future updateCategory(String id, String name, String brandId) async {
    final data = {"id": id, "name": name, "brandId": int.parse(brandId)};

    await PafApi.httpPut('/category/update-category/$id', data);

    categoryList = categoryList.map((e) {
      if (e.id.toString() != id) return e;

      e.name = name;
      e.brandId = int.parse(brandId);

      return e;
    }).toList();

    notifyListeners();
  }

  Future deleteCategory(int id) async {
    await PafApi.httpDelete('/category/delete-category/$id', {});

    categoryList.removeWhere((category) => category.id == id);
    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(Category category) getField) {
    categoryList.sort((a, b) {
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
