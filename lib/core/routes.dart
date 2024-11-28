import 'package:reserva_salao/features/agendamento/presentation/agendamento_page.dart';
import 'package:reserva_salao/features/realiza_login/presentation/login_dio_page.dart';
import 'package:go_router/go_router.dart';
import 'package:reserva_salao/features/realiza_login/presentation/login_page.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: "/",
        builder: (context, state) => const LoginPage(),
    )
  ],
);
