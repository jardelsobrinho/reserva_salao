import 'package:reserva_salao/core/failure.dart';

class CredenciaisInvalidas extends Failure {
  CredenciaisInvalidas({required super.message});
}

class EmailRequiredFailure extends Failure {
  EmailRequiredFailure({required super.message});
}
