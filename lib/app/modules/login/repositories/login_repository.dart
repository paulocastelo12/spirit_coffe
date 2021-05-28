import 'package:dio/dio.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';
import 'package:spirit_coffe/app/modules/login/repositories/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final Dio dio;
  LoginRepository(this.dio);

  @override
  Future<UserModel> login(Map<String, dynamic> data) async {
    try {
      var response = await dio.post("/login", data: data);

      print(response.data.toString());
      return UserModel.fromJson(response.data);
    } catch (e) {
      print(e);

      return null;
    }
  }

  @override
  Future<void> findAll() async {
    var response = await dio.get("/users");

    print("Users => " + response.data.toString());
  }
}
