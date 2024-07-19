import 'dart:convert';

enum TypeLogin {
  email(value: "EMAIL"),
  google(value: "GOOGLE");

  final String value;
  const TypeLogin({required this.value});

  factory TypeLogin.fromMap(String map) {
    switch (map) {
      case "EMAIL":
        return TypeLogin.email;
      case "GOOGLE":
        return TypeLogin.google;
      default:
        return throw Exception("value invalid");
    }
  }

  Map<String, String> toMap() {
    return <String, String>{'type_login': value};
  }

  String toJson() => json.encode(toMap());
}
