import 'package:spirit_coffe/app/core/models/user_model.dart';

abstract class IAuthRepository {
  Future<UserModel> login(Map<String, dynamic> data);
}