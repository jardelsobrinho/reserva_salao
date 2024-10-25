import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:reserva_salao/core/routes.dart';

class AgendamentoPage extends StatefulWidget {
  final String nome;
  const AgendamentoPage({super.key, required this.nome});

  @override
  State<AgendamentoPage> createState() => _AgendamentoPageState();
}

class _AgendamentoPageState extends State<AgendamentoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.nome),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            context.pop();
          },
          child: const Text("Voltar"),
        ),
      ),
    );
  }
}
