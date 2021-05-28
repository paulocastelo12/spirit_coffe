import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';
import 'package:spirit_coffe/app/modules/login/newuser/repositories/newuser_repository_interface.dart';

part 'newuser_store.g.dart';

enum SingingCharacter { masculine, feminine }

class NewuserStore = _NewuserStoreBase with _$NewuserStore;

INewUserRepository _iNewUserRepository = Modular.get();

abstract class _NewuserStoreBase with Store {
  @observable
  String name;

  @observable
  String phone;

  @observable
  String datebirthday;

  @observable
  SingingCharacter gender = SingingCharacter.masculine;

  @action
  setGender(SingingCharacter value) => gender = value;

  Future<void> savenewuser() async {
    var inputFormat = DateFormat("dd/MM/yyyy");
    var date = inputFormat.parse("$datebirthday");

    String formatPhone = phone.replaceAll(' ', '');
    formatPhone = formatPhone.replaceAll('(', '');
    formatPhone = formatPhone.replaceAll(')', '');
    formatPhone = formatPhone.replaceAll('-', '');

    Map<String, dynamic> data = {
      "name": name,
      "datebirthday": date.toIso8601String(),
      "phone": formatPhone,
      "gender": gender == SingingCharacter.masculine ? 'M' : 'F'
    };

    UserModel userModel = await _iNewUserRepository.createuser(data);
    
    if(userModel != null){
      Modular.to.pop();
    }
  }
}
