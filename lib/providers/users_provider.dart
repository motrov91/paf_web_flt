import 'package:flutter/material.dart';
import 'package:paf_web/api/pafapi.dart';
import 'package:paf_web/models/http/usersResponse.dart';

import 'package:paf_web/models/user.dart';

class UsersProvider with ChangeNotifier {
  List<User> usersList = [];
  bool ascending = true;
  int? sortColumnIndex;
  String rolId = '';

  UsersProvider() {
    getUsers();
  }

  getUsers() async {
    final resp = await PafApi.httpGet('/user/all-users');
    final usersResp = UserResponse.fromMap(resp);

    usersList = [...usersResp.users];

    notifyListeners();
  }

  Future register(String name, String email, String password,
      String repeatPassword, String cargo) async {
    var rolInt = int.parse(rolId);

    final data = {
      "name": name,
      "email": email,
      "password": password,
      "repeat_password": repeatPassword,
      "cargo": cargo,
      "rolId": rolInt
    };

    //Peticion http
    final response = await PafApi.httpPost('/user/add-user', data);
    final newResponse = User.fromMap(response);
    usersList.add(newResponse);

    //Send configureDio because i have a new JWT and i want to that a new JWT are in all petitions
    PafApi.configureDio();

    notifyListeners();
  }

  Future updateUser(
      String id, String name, String email, String cargo, String rolId) async {
    final data = {"name": name, "email": email, "cargo": cargo, "rolId": rolId};

    //Peticion http
    await PafApi.httpPut('/user/update-user/$id', data);

    usersList = usersList.map(
      (user) {
        if (user.id.toString() != id.toString()) return user;

        user.name = name;
        user.email = email;
        user.cargo = cargo;
        user.rolId = int.parse(rolId);

        return user;
      },
    ).toList();

    notifyListeners();
  }

  Future deleteUser(int id) async {
    //Peticion http
    await PafApi.httpDelete('/user/delete-user/$id', {});

    usersList.removeWhere((user) => user.id == id);

    notifyListeners();
  }

  void sort<T>(Comparable<T> Function(User user) getField) {
    usersList.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });

    ascending = !ascending;

    notifyListeners();
  }

  // bool validFormRegister(String pass, String repeatPass) {
  //   if (pass == repeatPass) {
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }
}
