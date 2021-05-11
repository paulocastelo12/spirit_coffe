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

  final _$nomeUserAtom = Atom(name: '_LoginStoreBase.nomeUser');

  @override
  String get nomeUser {
    _$nomeUserAtom.reportRead();
    return super.nomeUser;
  }

  @override
  set nomeUser(String value) {
    _$nomeUserAtom.reportWrite(value, super.nomeUser, () {
      super.nomeUser = value;
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

  final _$loginAsyncAction = AsyncAction('_LoginStoreBase.login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
loading: ${loading},
nomeUser: ${nomeUser},
numberPhone: ${numberPhone}
    ''';
  }
}
