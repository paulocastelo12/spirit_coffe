import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';

import 'repositories/login_repository_interface.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;
abstract class _LoginStoreBase with Store {

  ILoginRepository loginRepository = Modular.get();

  @observable
  bool loading = false;

  @observable
  String nomeUser = "";

  @observable
  String numberPhone = "";

  UserModel userModel;

  @action
  login() async {
    loading = true;
      await Future.delayed(const Duration(milliseconds: 1000));
      print(this.nomeUser+" "+this.numberPhone);

      userModel = await loginRepository.login( {"nomeUser":"$nomeUser", "numberPhone":"$numberPhone"});

      if(userModel != null){
        Modular.to.pushNamed('/home');
      }
      
    loading = false;
  }
}