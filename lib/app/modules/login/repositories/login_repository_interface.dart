import 'package:spirit_coffe/app/core/models/user_model.dart';

abstract class ILoginRepository {
  Future<UserModel> login(Map<String, dynamic> data);
  Future<void> findAll();
}
