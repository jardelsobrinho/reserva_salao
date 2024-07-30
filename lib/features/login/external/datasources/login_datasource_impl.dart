import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/login/data/datasources/login_datasource.dart';
import 'package:reserva_salao/features/login/data/models/data_token_model.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final Dio dio;

  LoginDatasourceImpl({required this.dio});

  @override
  Future<DataTokenModel> realizaLogin({required String userName, required String password}) async {
    try {
      final response = await dio.post("http://localhost:5000/usuario/login", data: {userName: userName, password: password});
      if (response.statusCode != 200) {
        throw DataSourceFailure(message: response.data['errorMessage']);
      }
      return DataTokenModel.fromJson(response.data);
    } on DioException catch (e) {
      if (e.response == null) {
        throw DataSourceFailure(message: e.message ?? e.toString());
      }
      throw DataSourceFailure(message: e.response?.data['errorMessage']);
    } catch (e) {
      debugPrint(e.toString());
      throw DataSourceFailure(message: e.toString());
    }
  }
}
