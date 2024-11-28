import 'package:flutter/material.dart';
import 'package:reserva_salao/features/realiza_login/presentation/states/login_controller.dart';

class LoginRodapeWidget extends StatelessWidget {
  final LoginController controller;
  const LoginRodapeWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => controller.realizaLogin(
              usuario: "nome",
              password: "password",
            ),
        child: const Text("Esqueci a senha"));
  }
}
