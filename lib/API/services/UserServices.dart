import 'package:sc_app/API/ResponseHelper.dart';
import 'package:sc_app/API/models/Response.dart';

class UserServices {
  static Future<Response<String?>> login(String email, String password) async{
    final body = <String, String>{
      'email': email,
      'password': password
    };
    final response = await ResponseHelper.post<String?>("user/login", body);
    return response;
  }
}