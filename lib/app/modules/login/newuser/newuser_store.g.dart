// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'newuser_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewuserStore on _NewuserStoreBase, Store {
  final _$nameAtom = Atom(name: '_NewuserStoreBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$phoneAtom = Atom(name: '_NewuserStoreBase.phone');

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  final _$datebirthdayAtom = Atom(name: '_NewuserStoreBase.datebirthday');

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

  final _$genderAtom = Atom(name: '_NewuserStoreBase.gender');

  @override
  SingingCharacter get gender {
    _$genderAtom.reportRead();
    return super.gender;
  }

  @override
  set gender(SingingCharacter value) {
    _$genderAtom.reportWrite(value, super.gender, () {
      super.gender = value;
    });
  }

  final _$_NewuserStoreBaseActionController =
      ActionController(name: '_NewuserStoreBase');

  @override
  dynamic setGender(SingingCharacter value) {
    final _$actionInfo = _$_NewuserStoreBaseActionController.startAction(
        name: '_NewuserStoreBase.setGender');
    try {
      return super.setGender(value);
    } finally {
      _$_NewuserStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
phone: ${phone},
datebirthday: ${datebirthday},
gender: ${gender}
    ''';
  }
}
