import 'package:dartz/dartz.dart';
import 'package:leaptech_plus/core/errors/failure.dart';
import 'package:leaptech_plus/features/login/data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password});
}
