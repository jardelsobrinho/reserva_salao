import 'package:reserva_salao/features/realiza_login/domain/entities/dados_login.dart';

class DadosLoginModel extends DadosLogin {
  final bool isSuccess;
  final bool isFailure;
  final String? error;
  const DadosLoginModel({
    required super.nome,
    required super.token,
    required this.isSuccess,
    required this.isFailure,
    this.error,
  });

  factory DadosLoginModel.fromJson(Map<String, dynamic> json) {
    return DadosLoginModel(
      nome: json["value"]["nome"],
      token: json["value"]["token"],
      isSuccess: json["isSuccess"],
      isFailure: json["isFailure"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nome": nome,
      "token": token,
      "isSuccess": isSuccess,
      "isFailure": isFailure,
    };
  }

  @override
  List<Object?> get props => [nome, token, isSuccess, isFailure, error];
}
