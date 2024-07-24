import 'package:reserva_salao/features/login/domain/entities/data_token.dart';

class DataTokenModel extends DataToken {
  const DataTokenModel({required super.token, required super.refreshToken});

  factory DataTokenModel.fromJson(Map<String, dynamic> json) {
    return DataTokenModel(
      token: json["token"],
      refreshToken: json["refreshToken"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "token": token,
      "refreshToken": refreshToken,
    };
  }
}
