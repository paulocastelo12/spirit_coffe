import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_coffe/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
      ),
      body: Container(
        margin: EdgeInsets.only(left: 12, right: 12),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (_, int index) {
                return Column(
                  children: [
                    ListTile(
                      onTap: () => Modular.to.pushNamed("/home/run_music"),
                      leading: Icon(
                        Icons.play_arrow,
                        size: 42,
                        color: Colors.green[400],
                      ),
                      title: Text(
                        "Dia 12 de Dezembro 2021, Segunda-Feira",
                        style: GoogleFonts.lato(fontSize: 15.5),
                      ),
                      subtitle: Text(
                        "Autor: Ap. Canuto Couto",
                        style: GoogleFonts.lato(fontSize: 14.5),
                      ),
                    
                    ),
                    Divider()
                  ],
                );
              },
            )),
          ],
        ),
      ),
    );
  }
}
