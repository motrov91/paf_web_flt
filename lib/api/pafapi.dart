import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:paf_web/services/local_storage.dart';

class PafApi {
  //Intancia de dio
  static final Dio _dio = Dio();

  static void configureDio() {
    //Url api
    /*Local*/ _dio.options.baseUrl = "http://localhost:3000"; 
    // /*Producción*/ _dio.options.baseUrl = "https://apipafnjs-production.up.railway.app"; 
    // /*Testing*/ _dio.options.baseUrl = "https://apipafnjs-production-e7a0.up.railway.app/"; 

    //Configuración headers
    _dio.options.headers = {
      'x-token': LocalStorage.prefs.getString('token') ?? '',
    };
  }

  //Peticiones get
  static Future httpGet(String path) async {
    try {
      final response = await _dio.get(path);
      return response.data;
    } catch (e) {
      throw ('Error en el GET $e ');
    }
  }

  //Peticiones post
  static Future httpPost(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.post(path, data: data);
      return response.data;
    } catch (e) {
      throw ('Error en el POST $e');
    }
  }

  //Peticion put
  static Future httpPut(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.put(path, data: data);
      return response.data;
    } catch (e) {
      throw ('Error en el PUT');
    }
  }

  //Peticion put
  static Future httpDelete(String path, Map<String, dynamic> data) async {
    try {
      final response = await _dio.delete(path, data: data);
      return response.data;
    } catch (e) {
      throw ('Error en el DELETE $e');
    }
  }

  static Future uploadFile(String path, Uint8List bytes) async {
    final formData =
        FormData.fromMap({'archivo': MultipartFile.fromBytes(bytes)});

    try {
      final response = await _dio.put(path, data: formData);
      return response.data;
    } catch (e) {
      throw ('Error en el PUT $e');
    }
  }
}
