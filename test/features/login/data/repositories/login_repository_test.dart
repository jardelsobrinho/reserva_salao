import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/login/data/datasources/login_datasource.dart';
import 'package:reserva_salao/features/login/data/models/data_token_model.dart';
import 'package:reserva_salao/features/login/data/repositories/login_repository_impl.dart';
import 'package:reserva_salao/features/login/domain/entities/data_token.dart';

import 'login_repository_test.mocks.dart';

@GenerateMocks([LoginDatasource])
main() {
  final datasource = MockLoginDatasource();
  final repository = LoginRepositoryImpl(datasource: datasource);
  group('realizaLogin', () {
    test('deve retornar uma lista de DataTokenModel', () async {
      when(datasource.realizaLogin(
        userName: anyNamed("userName"),
        password: anyNamed("password"),
      )).thenAnswer((_) async => const DataTokenModel(
            nome: "nome",
            email: "email",
            token: "token",
          ));

      final result = await repository.realizaLogin(userName: "joao", password: "123");

      expect(result.fold(id, id), isA<DataToken>());
      verify(datasource.realizaLogin(
        userName: anyNamed("userName"),
        password: anyNamed("password"),
      )).called(1);
      verifyNoMoreInteractions(datasource);
    });

    test('deve retorna uma DataSourceFailure caso o datasource falhe', () async {
      when(datasource.realizaLogin(userName: anyNamed("userName"), password: anyNamed("password"))).thenThrow(() => Exception());

      final result = await repository.realizaLogin(userName: "userName", password: "password");

      expect(result.fold(id, id), isA<DataSourceFailure>());
      verify(datasource.realizaLogin(
        userName: anyNamed("userName"),
        password: anyNamed("password"),
      )).called(1);
      verifyNoMoreInteractions(datasource);
    });
  });
}
