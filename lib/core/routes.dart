import 'package:reserva_salao/features/agendamento/presentation/agendamento_page.dart';
import 'package:reserva_salao/features/realiza_login/presentation/login_dio_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
        path: "/",
        builder: (context, state) => const LoginDioPage(),
        routes: <RouteBase>[
          GoRoute(
              path: "agendamento/:nome/:cidade/",
              builder: (_, state) {
                final nome = state.pathParameters["nome"];
                return AgendamentoPage(nome: nome!);
              }),
          GoRoute(
              path: "cliente/",
              builder: (_, state) {
                final nome = state.pathParameters["nome"];
                return AgendamentoPage(nome: nome!);
              })
        ])
  ],
);
