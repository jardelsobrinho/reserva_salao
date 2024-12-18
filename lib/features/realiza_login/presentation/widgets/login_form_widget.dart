import 'package:flutter/material.dart';
import 'package:reserva_salao/core/widgets/custom_scroll_widget.dart';
import 'package:reserva_salao/core/widgets/textbox_widget.dart';
import 'package:reserva_salao/features/agendamento/presentation/agendamento_page.dart';
import 'package:reserva_salao/features/realiza_login/presentation/states/login_controller.dart';

class LoginFormWidget extends StatelessWidget {
  final LoginController controller;
  const LoginFormWidget({required this.controller, super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 12,
        ),
        child: CustomScrollWidget(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const TextboxWidget(label: "Usuário"),
              const TextboxWidget(label: "Password"),
              ElevatedButton(
                  onPressed: () {
                    controller.realizaLogin(usuario: "usuario", password: "password");
                  }, child: const Text("Realizar Login"))
            ],
          ),
        ),
      ),
    );
  }
}
