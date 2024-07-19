import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';

abstract class ProductRepo {
  //  remote
  Future<DataState<List<ProductEntity>>> getProducts();
  Future<DataState<void>> saveProduct(ProductEntity request);
  Future<DataState<void>> deleteProduct(int id);
}
