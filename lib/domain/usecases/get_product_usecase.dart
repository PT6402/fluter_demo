// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/product_repo.dart';

class GetProductUsecase
    implements Usecase<DataState<List<ProductEntity>>, void> {
  final ProductRepo _productRepo;
  GetProductUsecase(this._productRepo);

  @override
  Future<DataState<List<ProductEntity>>> call({void params}) {
    return _productRepo.getProducts();
  }
}
