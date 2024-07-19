import 'dart:io';
import 'package:demo_product_clear_architech/core/resource/data_state.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/product_api_service.dart';
import 'package:demo_product_clear_architech/data/model/product_model.dart';
import 'package:demo_product_clear_architech/domain/entities/product_entity.dart';
import 'package:demo_product_clear_architech/domain/repository/product_repo.dart';
import 'package:dio/dio.dart';

class ProductRepoImpl implements ProductRepo {
  final ProductApiService _productApiService;
  ProductRepoImpl(
    this._productApiService,
  );

  @override
  Future<DataState<List<ProductModel>>> getProducts() async {
    try {
      final result = await _productApiService.getProducts();
      if (result.response.statusCode == HttpStatus.ok) {
        return DataSuccess(result.data, null);
      } else {
        return DataFail(DioException(
            requestOptions: result.response.requestOptions,
            response: result.response,
            error: result.response.statusCode,
            type: DioExceptionType.badResponse));
      }
    } on DioException catch (e) {
      return DataFail(e);
    }
  }

  @override
  Future<DataState<void>> saveProduct(ProductEntity request) async {
    var result =
        await _productApiService.saveProduct(ProductModel.fromEntity(request));

    if (result.response.statusCode == HttpStatus.ok) {
      return const DataSuccess(null, null);
    } else {
      return DataFail(DioException(
          requestOptions: result.response.requestOptions,
          error: result.response.statusCode,
          response: result.response,
          type: DioExceptionType.badResponse));
    }
  }

  @override
  Future<DataState<void>> deleteProduct(int id) async {
    var result = await _productApiService.deleteProduct(id);
    if (result.response.statusCode == HttpStatus.noContent) {
      return const DataSuccess(null, null);
    } else {
      return DataFail(DioException(
          requestOptions: result.response.requestOptions,
          type: DioExceptionType.badResponse,
          response: result.response,
          error: result.response.statusCode));
    }
  }
}
