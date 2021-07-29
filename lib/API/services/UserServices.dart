import 'package:sc_app/API/ResponseHelper.dart';
import 'package:sc_app/API/models/LogInResponse.dart';
import 'package:sc_app/API/models/Response.dart';

class UserServices {
  static Future<Response<LoginResponse>> login(String email, String password) async{
    final body = <String, String>{
      'email': email,
      'password': password
    };
    final response = await ResponseHelper.post<dynamic>("user/login", body);
    if (response.error) {
      return Response(data: null, message: response.message, error: true);
    }
    final loginResponse = LoginResponse.fromJson(response.data);
    return Response(data: loginResponse, message: response.message, error: false);
  }
}