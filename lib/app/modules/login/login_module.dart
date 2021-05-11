import 'package:dio/dio.dart';
import 'package:spirit_coffe/app/modules/login/login_Page.dart';
import 'package:spirit_coffe/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spirit_coffe/app/modules/login/repositories/login_repository.dart';

import 'repositories/login_repository_interface.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore()),
    Bind<ILoginRepository>((i) => LoginRepository(i.get<Dio>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
