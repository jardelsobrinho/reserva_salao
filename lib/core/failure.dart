abstract class Failure implements Exception {
  final String message;
  Failure({required this.message});
}

class RepositoryFailure extends Failure {
  RepositoryFailure({required super.message});
}

class DatasourceFailure extends Failure {
  DatasourceFailure({required super.message});
}
