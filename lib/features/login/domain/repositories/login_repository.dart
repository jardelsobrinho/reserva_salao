import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/features/login/domain/entities/data_token.dart';

abstract class LoginRepository {
  Future<Either<Failure, DataToken>> realizaLogin({
    required String userName,
    required String password,
  });
}
