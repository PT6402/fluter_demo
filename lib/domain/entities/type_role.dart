import 'dart:convert';

enum TypeRole {
  user(value: "USER"),
  admin(value: "ADMIN");

  final String value;
  const TypeRole({required this.value});

  factory TypeRole.fromMap(String map) {
    switch (map) {
      case "ADMIN":
        return TypeRole.admin;
      case "USER":
        return TypeRole.user;
      default:
        return throw Exception("value invalid");
    }
  }

  Map<String, String> toMap() => {'type_role': value};

  String toJson() => json.encode(toMap());
}
