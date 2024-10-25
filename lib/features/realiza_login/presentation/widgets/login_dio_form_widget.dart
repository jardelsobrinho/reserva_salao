import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:reserva_salao/core/routes.dart';

class LoginDioFormWidget extends StatelessWidget {
  final String assetName = 'assets/hat-svgrepo-com.svg';

  const LoginDioFormWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final Widget svg = Image.network(
      "https://hermes.digitalinnovation.one/assets/diome/logo.png",
      width: 350,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        svg,
        Text("Já tem um cadastro?",
            style: Theme.of(context).textTheme.headlineMedium),
        Text(
          "faça seu login e make the change...",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person, color: Colors.purple),
                ),
              ),
              const TextField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.person, color: Colors.purple),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              ElevatedButton(onPressed: () {
                context.go("/agendamento/1");
              }, child: const Text("Entrar"))
            ],
          ),
        )
      ],
    );
  }
}
