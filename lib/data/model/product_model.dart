import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';

class ProductModel extends ProductEntity {
  ProductModel({super.id, super.name, super.price});

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'price': price,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] != null ? map['id'] as int : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as int : null,
    );
  }

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
        id: productEntity.id,
        name: productEntity.name,
        price: productEntity.price);
  }
}
