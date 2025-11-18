import 'package:hive_flutter/hive_flutter.dart';
import 'package:leaptech_plus/features/login/data/models/user_model.dart';

UserModel? getCurrentUser() {
  final userBox = Hive.box<UserModel>('userBox');
  final user = userBox.get('currentUser'); // returns null if no user
  return user;
}
