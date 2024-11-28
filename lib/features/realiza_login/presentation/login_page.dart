import 'package:flutter/material.dart';
import 'package:reserva_salao/features/realiza_login/presentation/states/login_controller.dart';
import 'package:reserva_salao/features/realiza_login/presentation/states/login_state.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_cabecalho_widget.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_form_widget.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_rodape_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late final LoginController controller;

  @override
  void initState() {
    controller = LoginController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
            valueListenable: controller,
            builder: (
              BuildContext context,
              value,
              Widget? child,
            ) {
              return switch (value) {
                LoginStateStart() => Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const LoginCabecalhoWidget(),
                      LoginFormWidget(
                        controller: controller,
                      ),
                      LoginRodapeWidget(
                        controller: controller,
                      ),
                    ],
                  ),
                LoginStateLoading() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                LoginStateSuccess() => const Center(child: Text("DEU CERTO!!")),
                LoginStateError() => Center(child: Text(value.message)),
              };
            }),
      ),
    );
  }
}
