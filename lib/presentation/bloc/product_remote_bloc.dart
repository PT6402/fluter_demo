import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/domain/usecases/delete_product_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/get_product_usecase.dart';
import 'package:demo_product_clear_architech/domain/usecases/save_product_usecase.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_event.dart';
import 'package:demo_product_clear_architech/presentation/bloc/product_remote_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductRemoteBloc extends Bloc<ProductRemoteEvent, ProductRemoteState> {
  final GetProductUsecase _getProductUsecase;
  final SaveProductUsecase _saveProductUsecase;
  final DeleteProductUsecase _deleteProductUsecase;
  ProductRemoteBloc(this._getProductUsecase, this._saveProductUsecase,
      this._deleteProductUsecase)
      : super(const ProductRemoteLoading()) {
    on<GetProduct>(onGetProduct);
    on<SaveProduct>(onSaveProduct);
    on<DeleteProduct>(onDeleteProduct);
  }

  void onGetProduct(GetProduct event, Emitter<ProductRemoteState> emit) async {
    final dataState = await _getProductUsecase();
    print(dataState.data);
    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ProductRemoteDone(dataState.data!));
    }

    if (dataState is DataFail) {
      emit(ProductRemoteFail(dataState.error!));
    }
  }

  void onSaveProduct(
      SaveProduct saveProduct, Emitter<ProductRemoteState> emit) async {
    final status = await _saveProductUsecase(params: saveProduct.productEntity);
    final dataState = await _getProductUsecase();
    if (status is DataFail) {
      print(status.error);
    }
    if (status is DataSuccess) {
      emit(ProductRemoteDone(dataState.data!));
    }
  }

  void onDeleteProduct(
      DeleteProduct deleteProduct, Emitter<ProductRemoteState> emit) async {
    final status = await _deleteProductUsecase(params: deleteProduct.id);
    final dataState = await _getProductUsecase();
    if (status is DataFail) {
      print(status.error);
    }
    if (status is DataSuccess) {
      emit(ProductRemoteDone(dataState.data!));
    }
  }
}
