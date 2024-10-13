import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/errors/failures_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repository.dart';
import 'package:reserva_salao/features/realiza_login/domain/usescases/realizar_login.dart';

import 'realizar_login_test.mocks.dart';

@GenerateMocks([LoginRepository])
main() {
  final repository = MockLoginRepository();
  final usecase = RealizaLogin(repository: repository);
  test("deve retornar um objeto DadosLogin", () async {
    when(repository.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).thenAnswer((_) async => const Right(DadosLogin(nome: "nome de teste", token: "token de teste")));

    const params = Params(email: "email de teste", password: "123");
    final result = (await usecase(params: params)).fold((l) => l, (r) => r);
    expect(result, isA<DadosLogin>());

    verify(repository.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("deve retornar um CredenciaisInvalidas caso usuario ou senha estiverem errados", () async {
    when(repository.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).thenAnswer((_) async => Left(RepositoryFailure(message: "Credenciais Inválidas")));

    const params = Params(email: "email de teste", password: "123");
    final result = (await usecase(params: params)).fold((l) => l, (r) => r);
    expect(result, isA<CredenciaisInvalidas>());

    verify(repository.realizarLogin(
      email: anyNamed("email"),
      password: anyNamed("password"),
    )).called(1);

    verifyNoMoreInteractions(repository);
  });

  test("deve retornar um EmailRequiredFailure caso o email esteja vazio", () async {
    const params = Params(email: "", password: "123");
    final result = (await usecase(params: params)).fold((l) => l, (r) => r);
    expect(result, isA<EmailRequiredFailure>());
  });
}
