// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ProductEntity {
  int? id;
  String? name;
  int? price;
  ProductEntity({
    this.id,
    this.name,
    this.price,
  });

  ProductEntity copyWith({
    int? id,
    String? name,
    int? price,
  }) {
    return ProductEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductEntity.fromMap(Map<String, dynamic> map) {
    return ProductEntity(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductEntity.fromJson(String source) =>
      ProductEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductEntity(id: $id, name: $name, price: $price)';
}
