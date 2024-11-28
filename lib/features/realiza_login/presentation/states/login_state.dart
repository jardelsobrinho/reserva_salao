sealed class LoginState {}

class LoginStateStart extends LoginState {}
class LoginStateLoading extends LoginState {}
class LoginStateSuccess extends LoginState {}
class LoginStateError extends LoginState {
  final String message;
  LoginStateError({required this.message});
}