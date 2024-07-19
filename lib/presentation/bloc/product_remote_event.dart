import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';

abstract class ProductRemoteEvent {
  final int? id;
  final ProductEntity? productEntity;
  const ProductRemoteEvent({this.productEntity, this.id});
}

class GetProduct extends ProductRemoteEvent {}

class SaveProduct extends ProductRemoteEvent {
  const SaveProduct(ProductEntity productEntity)
      : super(productEntity: productEntity);
}

class DeleteProduct extends ProductRemoteEvent {
  const DeleteProduct(int id) : super(id: id);
}
