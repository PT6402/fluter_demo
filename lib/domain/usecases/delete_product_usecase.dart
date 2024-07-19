import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/core/usecase/usecase.dart';
import 'package:demo_product_clear_architech/domain/repository/product_repo.dart';

class DeleteProductUsecase implements Usecase<DataState<void>, int> {
  final ProductRepo _productRepo;
  DeleteProductUsecase(this._productRepo);
  @override
  Future<DataState<void>> call({int? params}) {
    return _productRepo.deleteProduct(params!);
  }
}
