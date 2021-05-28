import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';

import 'repositories/login_repository_interface.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    //findAllUsers();
    getStringValuesSF();
  }

  ILoginRepository loginRepository = Modular.get();

  @observable
  bool loading = false;

  @observable
  String datebirthday = "";

  @action
  setTextDateBirthday(String value) => datebirthday = value;

  @observable
  String numberPhone = "";

  @action
  setTextNumberPhone(String value) => numberPhone = value;

  @observable
  bool checkSave = true;

  UserModel userModel;

  findAllUsers() async {
    await loginRepository.findAll();
  }

  @action
  login() async {
    loading = true;

    await Future.delayed(const Duration(milliseconds: 1000));
    //print(this.nomeUser + " " + this.numberPhone);

    var inputFormat = DateFormat("dd/MM/yyyy");
    var date = inputFormat.parse("$datebirthday");

    String formatPhone = numberPhone.replaceAll(' ', '');
    formatPhone = formatPhone.replaceAll('(', '');
    formatPhone = formatPhone.replaceAll(')', '');
    formatPhone = formatPhone.replaceAll('-', '');

    Map<String, dynamic> data = {
      "phone": formatPhone,
      "datebirthday": date.toIso8601String()
    };

    userModel = await loginRepository.login(data);

    if (userModel != null) {
      this.checkSave ? await saveSharedPref() : await removeSharedPref();
      Modular.to.pushReplacementNamed('/home');
    }

    loading = false;
  }

  @action
  movimentcheck() {
    this.checkSave = !this.checkSave;
  }

  saveSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('datebirthday', datebirthday);
    prefs.setString('numberPhone', numberPhone);
  }

  removeSharedPref() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }

  @action
  getStringValuesSF() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Return String
    String nameValueSF = "";
    prefs.getString('datebirthday') == null
        ? nameValueSF = ""
        : nameValueSF = prefs.getString('datebirthday');

    datebirthday = nameValueSF;

    String numberPhoneValueSF = "";
    prefs.getString('numberPhone') == null
        ? numberPhoneValueSF = ""
        : numberPhoneValueSF = prefs.getString('numberPhone');

    numberPhone = numberPhoneValueSF;
  }
}
