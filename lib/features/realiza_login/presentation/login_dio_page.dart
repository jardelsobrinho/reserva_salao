import 'package:flutter/material.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_dio_form_widget.dart';
import 'package:reserva_salao/features/realiza_login/presentation/widgets/login_dio_rodape_widget.dart';

class LoginDioPage extends StatefulWidget {
  const LoginDioPage({super.key});

  @override
  State<LoginDioPage> createState() => _LoginDioPageState();
}

class _LoginDioPageState extends State<LoginDioPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             Expanded( child: LoginDioFormWidget(),),
             LoginDioRodapeWidget(),
          ],
        ),
      ),
    );
  }
}
