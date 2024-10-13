import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:reserva_salao/core/failure.dart';
import 'package:reserva_salao/core/usecase.dart';
import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/errors/failures_login.dart';
import 'package:reserva_salao/features/realiza_login/domain/repositories/login_repository.dart';

class Params extends Equatable {
  final String email;
  final String password;

  const Params({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RealizaLogin extends UseCase<DadosLogin, Params> {
  final LoginRepository repository;

  RealizaLogin({required this.repository});

  @override
  Future<Either<Failure, DadosLogin>> call({required Params params}) async {
    if (params.email.isEmpty) {
      return Left(EmailRequiredFailure(message: "Email deve ser preenchido"));
    }

    var result = await repository.realizarLogin(
      email: params.email,
      password: params.password,
    );

    return result.fold(
      (l) => Left(
        CredenciaisInvalidas(message: l.message),
      ),
      (r) => Right(r),
    );
  }
}
