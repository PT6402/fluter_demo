import 'package:demo_product_clear_architech/core/constants/const_url.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/login_req.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/register_req.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/reset_password_req.dart';
import 'package:demo_product_clear_architech/data/data_source/remote/dto/result_dto.dart';
import 'package:demo_product_clear_architech/data/model/user_model.dart';
import 'package:demo_product_clear_architech/domain/entities/type_device.dart';
import 'package:demo_product_clear_architech/domain/entities/type_login.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'auth_api_service_impl.dart';

@RestApi(baseUrl: urlAuth)
abstract class AuthApiService {
  factory AuthApiService(Dio dio) = _AuthApiService;
  @POST("/login")
  Future<HttpResponse<ResultDto<UserModel?>>> login(@Body() LoginReq req);

  @POST("/register")
  Future<HttpResponse<ResultDto<UserModel?>>> register(@Body() RegisterReq req);

  //

  @GET("/check-type-login/{email}")
  Future<HttpResponse<TypeLogin?>> checkTypeLogin(@Path("email") String email);

  @GET("/forgot-password/{email}")
  Future<HttpResponse<String?>> forgotPassword(@Path("email") String email);

  @POST("/reset-password")
  Future<HttpResponse<void>> resetPassword(@Body() ResetPasswordReq req);

  @POST("/check-code-reset")
  Future<HttpResponse<void>> checkCodeReset(@Body() ResetPasswordReq req);

  @GET("/refresh-token/{typeDevice}")
  Future<HttpResponse<String?>> refreshToken(
      @Path("typeDevice") TypeDevice typeDevice);
}
