import 'dart:convert';

import 'package:http/http.dart' as http;

class AuthenticationClient {
  String url = "https://ec2-3-83-246-155.compute-1.amazonaws.com/auth";

  Future<String?> login(String username, String password) async {
    String endPoint = url + "/login";
    final uri = Uri.parse(endPoint);
    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": 'application/json; charset=UTF-8',
        },
        body: json.encode({
          "username": username,
          "password": password,
        }),
      );
      AuthResult _authResult = AuthResult.fromjson(json.decode(response.body));
      return _authResult.token;
    } catch (error) {
      print(error);
    }
  }

  Future<void> verify(String token) async {
    String endPoint = url + "/verify";
    final uri = Uri.parse(endPoint);
    try {
      final response = await http.post(
        uri,
        headers: {
          "Content-Type": 'application/json; charset=UTF-8',
          "0e4ef7f85f3b605d9a69a45f5692d5363b10f6c843b1794b4b2b5472211f536a":
              token
        },
      );
    } catch (error) {
      rethrow;
    }
  }
}

class AuthResult {
  const AuthResult({
    required this.token,
    required this.profile,
  });

  final String token;
  final AuthProfile profile;

  factory AuthResult.fromjson(Map<String, dynamic> json) {
    return AuthResult(
      token: json["token"],
      profile: AuthProfile.fromJson(json["user"]),
    );
  }
}

class AuthProfile {
  const AuthProfile({
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.renterId,
    required this.balanceId,
  });

  final String username;
  final String email;
  final int phoneNumber;
  final int renterId;
  final String balanceId;

  factory AuthProfile.fromJson(Map<String, dynamic> json) {
    return AuthProfile(
      username: json["username"],
      email: json["email"],
      phoneNumber: json["phoneNumber"],
      renterId: json["renterId"],
      balanceId: json["balanceId"],
    );
  }
}
