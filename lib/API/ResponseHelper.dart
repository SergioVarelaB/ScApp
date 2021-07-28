import 'dart:convert';
import 'dart:io';

import 'package:sc_app/API/models/Response.dart';
import 'package:http/http.dart' as http;
import 'package:sc_app/Utils/AppSharedPreferences.dart';



class ResponseHelper {
  static String getUrl() {
    return "http://192.168.1.72:3000/";
  }

  static Future<Response<T>> post<T>(String endpoint, Map<String, dynamic> body) async {
    final url = getUrl() + endpoint;
    final token = await AppSharedPreferences.getToken();
    final response = await http.post(
      Uri.parse(url),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        HttpHeaders.authorizationHeader: 'Bearer' + token
      },
      body: jsonEncode(body)
    );
    final responseBody = Response<T>.fromJson(jsonDecode(response.body));
    return responseBody;
  }

  static Future<Response<T>> patch<T>(String endpoint, Map<String, dynamic> body) async {
    final url = getUrl() + endpoint;
    final token = await AppSharedPreferences.getToken();
    final response = await http.patch(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer' + token
        },
        body: jsonEncode(body)
    );
    final responseBody = Response<T>.fromJson(jsonDecode(response.body));
    return responseBody;
  }

  static Future<Response<T>> delete<T>(String endpoint) async {
    final url = getUrl() + endpoint;
    final token = await AppSharedPreferences.getToken();
    final response = await http.delete(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer' + token
        }
    );
    final responseBody = Response<T>.fromJson(jsonDecode(response.body));
    return responseBody;
  }

  static Future<Response<T>> get<T>(String endpoint) async {
    final url = getUrl() + endpoint;
    final token = await AppSharedPreferences.getToken();
    final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          HttpHeaders.authorizationHeader: 'Bearer ' + token
        }
    );
    final responseBody = Response<T>.fromJson(jsonDecode(response.body));
    return responseBody;
  }
}