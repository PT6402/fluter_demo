import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/product_repo.dart';

class SaveProductUsecase implements Usecase<DataState<void>, ProductEntity> {
  final ProductRepo _productRepo;
  SaveProductUsecase(this._productRepo);
  @override
  Future<DataState<void>> call({ProductEntity? params}) {
    return _productRepo.saveProduct(params!);
  }
}
