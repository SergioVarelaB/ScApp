import 'User.dart';

class LoginResponse {
  final String? token;
  final User? user;

  LoginResponse({
    required this.token,
    required this.user
  });

  factory LoginResponse.fromJson(Map<String,dynamic> json) {
    return LoginResponse(
        token: json['Token'],
        user: User.fromJson(json['User'])
    );
  }
}