import 'package:flutter/cupertino.dart';
import 'package:logger/logger.dart';
import 'package:reserva_salao/features/realiza_login/presentation/states/login_state.dart';

class LoginController extends ValueNotifier<LoginState>{
  LoginController() : super(LoginStateStart());

  final Logger logger = Logger();

  void realizaLogin({required String usuario, required String password}) async {

    value = LoginStateLoading();

    await Future.delayed(const Duration(seconds: 2));

    value = LoginStateError(message: "deu errado aqui");

    await Future.delayed(const Duration(seconds: 3));

    value = LoginStateStart();

    throw Exception("Erro de proposito");
  }
}