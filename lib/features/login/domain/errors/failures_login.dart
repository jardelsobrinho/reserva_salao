import 'package:reserva_salao/core/failure.dart';

class InvalidCredentialsFailure extends Failure {
  InvalidCredentialsFailure({required super.message});
}

class UserNameRequiredFailure extends Failure {
  UserNameRequiredFailure() : super(message: "Usuário obrigatório");
}

class PasswordRequiredFailure extends Failure {
  PasswordRequiredFailure() : super(message: "Password obrigatório");
}
