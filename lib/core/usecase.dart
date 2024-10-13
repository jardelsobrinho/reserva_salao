import 'package:dartz/dartz.dart';
import 'package:reserva_salao/core/failure.dart';

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call({required Params params});
}
