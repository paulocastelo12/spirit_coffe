import 'package:spirit_coffe/app/core/models/user_model.dart';

abstract class INewUserRepository {
  Future<UserModel> createuser(Map<String, dynamic> data);
}
