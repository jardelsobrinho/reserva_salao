import 'package:flutter/material.dart';

class LoginDioRodapeWidget extends StatelessWidget {
  const LoginDioRodapeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {},
          child: const Text(
            "Esqueci minha senha",
            style: TextStyle(color: Colors.yellow),
          ),
        ),
        TextButton(
          onPressed: () {},
          child: const Text(
            "Criar conta",
            style: TextStyle(color: Colors.green),
          ),
        )
      ],
    );
  }
}