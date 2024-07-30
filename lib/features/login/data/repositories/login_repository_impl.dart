import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/login/data/datasources/login_datasource.dart';
import 'package:reserva_salao/features/login/domain/entities/data_token.dart';
import 'package:reserva_salao/features/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginDatasource datasource;

  LoginRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, DataToken>> realizaLogin({required String userName, required String password}) async {
    try {
      final dataTokenModel = await datasource.realizaLogin(userName: userName, password: password);
      return Right(dataTokenModel);
    } catch (e) {
      return Left(DataSourceFailure(message: e.toString()));
    }
  }
}
