import 'package:equatable/equatable.dart';

class DataToken extends Equatable {
  final String token;
  final String nome;
  final String email;

  const DataToken({
    required this.token,
    required this.nome,
    required this.email,
  });

  @override
  List<Object?> get props => [token, nome, email];
}
