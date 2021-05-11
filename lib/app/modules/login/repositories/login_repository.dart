import 'package:dio/dio.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';
import 'package:spirit_coffe/app/modules/login/repositories/login_repository_interface.dart';

class LoginRepository implements ILoginRepository {
  final Dio dio;
  LoginRepository(this.dio);

  @override
  Future<UserModel> login(Map<String, dynamic> data) async {

    UserModel userModel; 
    try {
      var response = await Dio().get('http://localhost:3000/users', queryParameters: data);
      print(response.data);

      userModel = UserModel(
        id: response.data[0]['id'],
        name: response.data[0]['name'],
        phone: response.data[0]['phone']
      );

    } catch (e) {
      print(e);
    }

    return userModel;
  }
}
