import 'package:dartz/dartz.dart';
import 'package:movies_app/core/Errors/failure.dart';

abstract class BaseUseCases<T> {
  Future<Either<Failure, T>> call();
}
