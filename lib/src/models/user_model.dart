import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.displayName,
    this.name,
    this.email,
    this.password,
  });

  String? displayName;
  String? name;
  String? email;
  String? password;

  factory User.fromJson(Map<String, dynamic> json) => User(
        displayName: json["displayName"],
        name: json["name"],
        email: json["email"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "displayName": displayName,
        "email": email,
        "password": password,
        "role": "teacher"
      };
}