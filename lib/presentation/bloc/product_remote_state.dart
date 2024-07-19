import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';
import 'package:dio/dio.dart';

class ProductRemoteState {
  final List<ProductEntity>? products;
  final DioException? error;
  const ProductRemoteState({this.products, this.error});
}

class ProductRemoteLoading extends ProductRemoteState {
  const ProductRemoteLoading();
}

class ProductRemoteDone extends ProductRemoteState {
  const ProductRemoteDone(List<ProductEntity> products)
      : super(products: products);
}

class ProductRemoteFail extends ProductRemoteState {
  const ProductRemoteFail(DioException error) : super(error: error);
}
