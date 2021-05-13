import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:spirit_coffe/app/modules/login/login_module.dart';

import 'core/utils/constants.dart';
import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton(
        (i) => Dio(BaseOptions(baseUrl: URL_BASE, connectTimeout: 30000))),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute('/home', module: HomeModule()),
  ];
}
