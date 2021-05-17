import 'package:flutter_modular/flutter_modular.dart';
import 'package:spirit_coffe/app/modules/run_music/runMusic_store.dart';
import 'package:flutter/material.dart';

class RunMusicPage extends StatefulWidget {
  final String title;
  const RunMusicPage({Key key, this.title = 'RunMusicPage'}) : super(key: key);
  @override
  RunMusicPageState createState() => RunMusicPageState();
}

class RunMusicPageState extends State<RunMusicPage> {
  final RunMusicStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Text("Run Audio Page")],
      ),
    );
  }
}
