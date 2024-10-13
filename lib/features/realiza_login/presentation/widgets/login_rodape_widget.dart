import 'package:flutter/material.dart';

class LoginRodapeWidget extends StatelessWidget {
  const LoginRodapeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () => debugPrint("oi"),
        child: const Text("Esqueci a senha"));
  }
}
