import 'package:flutter_modular/flutter_modular.dart';
import 'package:spirit_coffe/app/modules/run_music/runMusic_module.dart';
import '../home/home_store.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
    ModuleRoute('/run_music', module: RunMusicModule()),
  ];
}
