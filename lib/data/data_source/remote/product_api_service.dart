import 'package:demo_product_clear_architech/core/constants/const_url.dart';

import 'package:demo_product_clear_architech/data/model/product_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part "product_api_service.g.dart";

@RestApi(baseUrl: urlProduct)
abstract class ProductApiService {
  factory ProductApiService(Dio dio) = _ProductApiService;

  @GET("/")
  Future<HttpResponse<List<ProductModel>>> getProducts();

  @POST("/")
  Future<HttpResponse<void>> saveProduct(@Body() ProductModel request);

  @DELETE("/{id}")
  Future<HttpResponse<void>> deleteProduct(@Path("id") int id);
}
