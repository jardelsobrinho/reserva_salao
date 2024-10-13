import 'package:equatable/equatable.dart';

class DadosLogin extends Equatable {
  final String nome;
  final String token;

  const DadosLogin({required this.nome, required this.token});

  @override
  List<Object?> get props => [nome, token];
}
