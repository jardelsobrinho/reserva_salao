import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';

abstract class LoginRepository {
  Future<Either<RepositoryFailure, DadosLogin>> realizarLogin({
    required String email,
    required String password,
  });
}
