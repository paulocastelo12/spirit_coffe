import 'package:dio/dio.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';
import 'package:spirit_coffe/app/core/utils/global_scaffold.dart';

import 'newuser_repository_interface.dart';

class NewUserRepository implements INewUserRepository {
  final Dio dio;
  NewUserRepository(this.dio);

  @override
  Future<UserModel> createuser(Map<String, dynamic> data) async {
    GlobalScaffold.instance.showSnackbar();
    // try {
    //   var response = await dio.post("/users", data: data);
    //   print(response.data.toString());
    //   return UserModel.fromJson(response.data);
    // } catch (e) {
    //   print("Erro  => " + e.toString());
    //   return null;
    // }

    return null;
  }
}
