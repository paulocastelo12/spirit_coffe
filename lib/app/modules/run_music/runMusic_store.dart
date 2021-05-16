import 'package:mobx/mobx.dart';

part 'runMusic_store.g.dart';

class RunMusicStore = _RunMusicStoreBase with _$RunMusicStore;
abstract class _RunMusicStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}