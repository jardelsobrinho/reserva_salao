import 'package:equatable/equatable.dart';

class DataToken extends Equatable {
  final String token;
  final String refreshToken;

  const DataToken({
    required this.token,
    required this.refreshToken,
  });

  @override
  List<Object?> get props => [token, refreshToken];
}
