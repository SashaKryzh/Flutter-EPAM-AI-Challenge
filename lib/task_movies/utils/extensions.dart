import 'package:dartz/dartz.dart';

extension EitherExtensions<L, R> on Either<L, R> {
  L? leftOrNull() => fold((l) => l, (_) => null);
  R? rightOrNull() => fold((_) => null, (r) => r);
}
