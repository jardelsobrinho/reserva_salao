import 'package:reserva_salao/features/login/domain/entities/data_token.dart';

class DataTokenModel extends DataToken {
  const DataTokenModel({
    required super.token,
    required super.nome,
    required super.email,
  });

  factory DataTokenModel.fromJson(Map<String, dynamic> json) {
    return DataTokenModel(
      token: json["token"],
      nome: json["nome"],
      email: json["email"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "nome": nome,
      "email": email,
    };
  }
}
