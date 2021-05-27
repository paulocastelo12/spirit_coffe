import 'package:dio/dio.dart';
import 'package:spirit_coffe/app/modules/login/newuser/newuser_Page.dart';
import 'package:spirit_coffe/app/modules/login/newuser/newuser_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spirit_coffe/app/modules/login/newuser/repositories/newuser_repository.dart';
import 'package:spirit_coffe/app/modules/login/newuser/repositories/newuser_repository_interface.dart';

class NewuserModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => NewuserStore()),
    Bind.lazySingleton<INewUserRepository>(
        (i) => NewUserRepository(i.get<Dio>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => NewuserPage()),
  ];
}
