import 'package:flutter/material.dart';
import 'package:reserva_salao/core/widgets/custom_scroll_widget.dart';
import 'package:reserva_salao/core/widgets/textbox_widget.dart';

class LoginFormWidget extends StatelessWidget {
  const LoginFormWidget({super.key});

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
                  onPressed: () {}, child: const Text("Realizar Login"))
            ],
          ),
        ),
      ),
    );
  }
}
