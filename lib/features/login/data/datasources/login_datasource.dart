import 'package:reserva_salao/features/login/data/models/data_token_model.dart';

abstract class LoginDatasource {
  Future<DataTokenModel> realizaLogin({
    required String userName,
    required String password,
  }) {
    throw UnimplementedError();
  }
}
