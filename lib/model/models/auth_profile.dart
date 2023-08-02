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
