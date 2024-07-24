import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:reserva_salao/features/login/domain/entities/data_token.dart';
import 'package:reserva_salao/features/login/domain/errors/failures_login.dart';
import 'package:reserva_salao/features/login/domain/repositories/login_repository.dart';
import 'package:reserva_salao/features/login/domain/usecases/get_login.dart';

import 'get_login_test.mocks.dart';

@GenerateMocks([LoginRepository])
main() {
  late final MockLoginRepository repository;
  late final GetLogin usecase;

  setUp(() {
    repository = MockLoginRepository();
    usecase = GetLogin(repository: repository);
  });

  group('realiza_login', () {
    test('deve retorna um objeto DataToken', () async {
      when(repository.realizaLogin(any, any)).thenAnswer((_) async => const Right(DataToken(token: "", refreshToken: "")));

      const params = Params(userName: "userName", password: "password");
      final result = (await usecase(params: params)).fold((l) => l, (r) => r);
      expect(result, isA<DataToken>());

      verify(repository.realizaLogin(any, any)).called(1);
      verifyNoMoreInteractions(repository);
    });

    test('deve retorna um UserNameRequiredFailure se o userName estiver vazio', () async {
      when(repository.realizaLogin(any, any)).thenAnswer((_) async => const Right(DataToken(token: "", refreshToken: "")));

      const params = Params(userName: "", password: "password");
      final result = await usecase(params: params);
      expect(result.fold(id, id), isA<UserNameRequiredFailure>());
    });

    test('deve retorna um PasswordRequiredFailure se o password estiver vazio', () async {
      when(repository.realizaLogin(any, any)).thenAnswer((_) async => const Right(DataToken(token: "", refreshToken: "")));

      const params = Params(userName: "userName", password: "");
      final result = await usecase(params: params);
      expect(result.fold(id, id), isA<PasswordRequiredFailure>());
    });

    test('deve retorna uma InvalidCredentials caso o login seja inválido', () async {
      when(repository.realizaLogin(any, any)).thenAnswer((_) async => Left(InvalidCredentialsFailure(message: "")));

      const params = Params(userName: "userName", password: "123");
      final result = (await usecase(params: params)).fold(id, id);
      expect(result, isA<InvalidCredentialsFailure>());
      verify(repository.realizaLogin(any, any)).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
