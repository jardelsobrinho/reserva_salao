import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/login/data/models/data_token_model.dart';
import 'package:reserva_salao/features/login/external/datasources/login_datasource_impl.dart';

import '../../../fixtures/fixture_reader.dart';
import 'login_datasource_test.mocks.dart';

@GenerateMocks([Dio])
main() {
  final dio = MockDio();
  final datasource = LoginDatasourceImpl(dio: dio);

  group("realizaLogin", () {
    test("deve retorna um DataTokenModel", () async {
      when(dio.post(any, data: anyNamed("data"))).thenAnswer((_) async => Response(
            data: jsonDecode(fixture("data_token_response.json")),
            statusCode: 200,
            requestOptions: RequestOptions(),
          ));
      final result = await datasource.realizaLogin(userName: "userName", password: "password");
      expect(result, isA<DataTokenModel>());
    });

    test("deve retorna um DataSourceFailure caso de um erro de plataforma", () async {
      when(dio.post(any, data: anyNamed("data"))).thenThrow(Exception());
      final future = datasource.realizaLogin(userName: "userName", password: "password");
      expect(future, throwsA(isA<DataSourceFailure>()));
    });

    test("deve retorna um DataSourceFailure caso de erro com response preenchido", () async {
      final response = Response(
        statusCode: 400,
        requestOptions: RequestOptions(),
        data: {"errorMessage": "error"},
      );
      when(dio.post(any, data: anyNamed("data"))).thenThrow(DioException(response: response, requestOptions: RequestOptions()));
      final future = datasource.realizaLogin(userName: "userName", password: "password");
      expect(future, throwsA(isA<DataSourceFailure>()));
    });

    test("deve retorna um DataSourceFailure caso o response do erro venha null", () async {
      when(dio.post(any, data: anyNamed("data"))).thenThrow(DioException(requestOptions: RequestOptions()));
      final future = datasource.realizaLogin(userName: "userName", password: "password");
      expect(future, throwsA(isA<DataSourceFailure>()));
    });
  });
}
