import "dart:convert";

import "package:flutter_secure_storage/flutter_secure_storage.dart";
import "package:http/http.dart" as http;

class AuthService {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  Future<bool> checkToken() async {
    //  1

    final Uri uri = Uri.http("localhost:4000", "rentapp/graphql");

    //  2

    final String? token = await _storage.read(key: "token");

    if (token == null || token == "") {
      return false;
    }

    //  3

    final Map<String, dynamic> bodyMap = {
      "query": """
        query {
          user {
            id
          }
        }
      """,
    };

    final String body = jsonEncode(bodyMap);

    //  4

    final http.Response response = await http.post(
      uri,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: body,
    );

    final Map<String, dynamic> res = jsonDecode(response.body);

    //  5

    if (res["errors"] != null) {
      await _storage.delete(key: "token");
      return false;
    }

    return true;
  }

  Future<String> login({
    required String email,
    required String password,
  }) async {
    //  1

    final Uri uri = Uri.http("localhost:4000", "rentapp/graphql");

    //  2

    final Map<String, dynamic> bodyMap = {
      "query": """
        mutation {
          login(email: "$email", password: "$password", role: LANDLORD) {
            token
          }
        }
      """,
      "variables": {"email": email, "password": password},
    };

    final String body = jsonEncode(bodyMap);

    //  3

    final http.Response response = await http.post(
      uri,
      headers: {"Content-Type": "application/json"},
      body: body,
    );

    //  4

    final Map<String, dynamic> res = jsonDecode(response.body);

    if (res["errors"] != null) {
      throw Exception(res["errors"][0]["message"]);
    }

    //  5

    print(res["data"]["login"]["token"]);
    await _storage.write(key: "token", value: res["data"]["login"]["token"]);

    return "Success";
  }

  Future<void> logout() async {
    await _storage.delete(key: "token");
  }
}
