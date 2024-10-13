import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/realiza_login/data/datasources/login_datasource.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<Either<RepositoryFailure, DadosLogin>> realizarLogin({required String email, required String password}) async {
    try {
      final dadosLoginModel = await datasource.realizarLogin(email: email, password: password);
      return Right(dadosLoginModel);
    } catch (e) {
      return Left(RepositoryFailure(message: e.toString()));
    }
  }
}
