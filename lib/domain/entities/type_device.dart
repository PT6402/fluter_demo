import 'dart:convert';

enum TypeDevice {
  web(value: "WEB"),
  mobile(value: "MOBILE");

  final String value;
  const TypeDevice({required this.value});

  factory TypeDevice.fromMap(map) {
    switch (map) {
      case "WEB":
        return TypeDevice.web;
      case "MOBILE":
        return TypeDevice.mobile;
      default:
        return throw Exception("value invalid");
    }
  }

  Map<String, String> toMap() => {"type_device": value};

  String toJson() => json.encode(toMap());
}
