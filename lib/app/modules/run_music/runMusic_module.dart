import 'package:spirit_coffe/app/modules/run_music/runMusic_Page.dart';
import 'package:spirit_coffe/app/modules/run_music/runMusic_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RunMusicModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => RunMusicStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => RunMusicPage())
  ];
}
