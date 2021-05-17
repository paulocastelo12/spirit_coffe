import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:spirit_coffe/app/core/models/user_model.dart';

import 'repositories/login_repository_interface.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStoreBase with _$LoginStore;

abstract class _LoginStoreBase with Store {
  _LoginStoreBase() {
    getStringValuesSF();
  }

  ILoginRepository loginRepository = Modular.get();

  @observable
  bool loading = false;

  @observable
  String nomeUser = "";

  @action
  setTextNomeUser(String value) => nomeUser = value;

  @observable
  String numberPhone = "";

  @action
  setTextNumberPhone(String value) => numberPhone = value;

  @observable
  bool checkSave = true;

  UserModel userModel;

  @action
  login() async {
    loading = true;

    await Future.delayed(const Duration(milliseconds: 1000));
    //print(this.nomeUser + " " + this.numberPhone);

    userModel = await loginRepository
        .login({"nomeUser": "$nomeUser", "numberPhone": "$numberPhone"});

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
    prefs.setString('name', nomeUser);
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
    prefs.getString('name') == null
        ? nameValueSF = ""
        : nameValueSF = prefs.getString('name');

    nomeUser = nameValueSF;

    String numberPhoneValueSF = "";
    prefs.getString('numberPhone') == null
        ? numberPhoneValueSF = ""
        : numberPhoneValueSF = prefs.getString('numberPhone');

    numberPhone = numberPhoneValueSF;
  }
}
