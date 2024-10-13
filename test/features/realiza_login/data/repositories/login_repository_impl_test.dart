import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/data/datasources/login_datasource.dart';
import 'package:reserva_salao/features/realiza_login/data/models/dados_login_model.dart';
import 'package:reserva_salao/features/realiza_login/data/repositories/login_repository_impl.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';

import 'login_repository_impl_test.mocks.dart';

@GenerateMocks([LoginDatasource])
void main() {
  final datasource = MockLoginDatasource();
  final repository = LoginRepositoryImpl(datasource: datasource);
  test('deve retorna um DadosLogin', () async {
    when(datasource.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).thenAnswer((_) async => const DadosLoginModel(
          nome: "nome",
          token: "token",
          isFailure: false,
          isSuccess: true,
        ));

    final result = await repository.realizarLogin(email: "email", password: "password");

    expect(result.fold(id, id), isA<DadosLogin>());

    verify(datasource.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).called(1);
  });

  test('deve retornar um RepositoryFailure caso aconteca uma excecao', () async {
    when(datasource.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).thenThrow((_) async => Exception());

    final result = await repository.realizarLogin(email: "email", password: "password");
    expect(result.fold(id, id), isA<RepositoryFailure>());

    verify(datasource.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).called(1);

    verifyNoMoreInteractions(datasource);
  });
}
