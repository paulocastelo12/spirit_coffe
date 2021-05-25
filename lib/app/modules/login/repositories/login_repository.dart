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

       FormData formData = FormData.fromMap(
          {"name": 'Julyane K. Castelo', "phone": '92981261466'});

        var response = await dio.get(
        "http://192.168.100.3:3000/users",
      );


      print(response.data);

      userModel = UserModel(
          id: response.data[0]['id'],
          name: response.data[0]['name'],
          phone: response.data[0]['phone']);
    } catch (e) {
      print(e);
    }

    return userModel;
  }
}
