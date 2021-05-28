// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginStore on _LoginStoreBase, Store {
  final _$loadingAtom = Atom(name: '_LoginStoreBase.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$datebirthdayAtom = Atom(name: '_LoginStoreBase.datebirthday');

  @override
  String get datebirthday {
    _$datebirthdayAtom.reportRead();
    return super.datebirthday;
  }

  @override
  set datebirthday(String value) {
    _$datebirthdayAtom.reportWrite(value, super.datebirthday, () {
      super.datebirthday = value;
    });
  }

  final _$numberPhoneAtom = Atom(name: '_LoginStoreBase.numberPhone');

  @override
  String get numberPhone {
    _$numberPhoneAtom.reportRead();
    return super.numberPhone;
  }

  @override
  set numberPhone(String value) {
    _$numberPhoneAtom.reportWrite(value, super.numberPhone, () {
      super.numberPhone = value;
    });
  }

  final _$checkSaveAtom = Atom(name: '_LoginStoreBase.checkSave');

  @override
  bool get checkSave {
    _$checkSaveAtom.reportRead();
    return super.checkSave;
  }

  @override
  set checkSave(bool value) {
    _$checkSaveAtom.reportWrite(value, super.checkSave, () {
      super.checkSave = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_LoginStoreBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  final _$getStringValuesSFAsyncAction =
      AsyncAction('_LoginStoreBase.getStringValuesSF');

  @override
  Future getStringValuesSF() {
    return _$getStringValuesSFAsyncAction.run(() => super.getStringValuesSF());
  }

  final _$_LoginStoreBaseActionController =
      ActionController(name: '_LoginStoreBase');

  @override
  dynamic setTextDateBirthday(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setTextDateBirthday');
    try {
      return super.setTextDateBirthday(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTextNumberPhone(String value) {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.setTextNumberPhone');
    try {
      return super.setTextNumberPhone(value);
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic movimentcheck() {
    final _$actionInfo = _$_LoginStoreBaseActionController.startAction(
        name: '_LoginStoreBase.movimentcheck');
    try {
      return super.movimentcheck();
    } finally {
      _$_LoginStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading},
datebirthday: ${datebirthday},
numberPhone: ${numberPhone},
checkSave: ${checkSave}
    ''';
  }
}
