abstract class Failure implements Exception {
  final String message;
  Failure({required this.message});
}

class DataSourceFailure extends Failure {
  DataSourceFailure({required super.message});
}
