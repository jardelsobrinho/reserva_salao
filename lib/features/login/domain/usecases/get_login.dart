import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/core/usecase.dart';
import 'package:reserva_salao/features/login/domain/entities/data_token.dart';
import 'package:reserva_salao/features/login/domain/errors/failures_login.dart';
import 'package:reserva_salao/features/login/domain/repositories/login_repository.dart';

class Params extends Equatable {
  final String userName;
  final String password;

  const Params({required this.userName, required this.password});

  @override
  List<Object?> get props => [userName, password];
}

class GetLogin extends UseCase<DataToken, Params> {
  final LoginRepository repository;

  GetLogin({required this.repository});

  @override
  Future<Either<Failure, DataToken>> call({required Params params}) async {
    if (params.userName.isEmpty) {
      return Left(UserNameRequiredFailure());
    }

    if (params.password.isEmpty) {
      return Left(PasswordRequiredFailure());
    }

    return repository.realizaLogin(
      userName: params.userName,
      password: params.password,
    );
  }
}
