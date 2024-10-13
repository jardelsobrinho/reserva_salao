import 'package:flutter/material.dart';
import 'package:reserva_salao/core/theme.dart';
import 'package:reserva_salao/features/realiza_login/presentation/login_dio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeCustom.getThemeLight(),
      darkTheme: ThemeCustom.getThemeDark(),
      home: const LoginDioPage(),
    );
  }
}


