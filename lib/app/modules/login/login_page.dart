import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_coffe/app/core/components/loading_component.dart';
import 'package:spirit_coffe/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';

import 'components/login_form.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 32, right: 32, top: 80),
              child: Column(
                children: <Widget>[
                  Center(
                    child: Container(
                      child: Icon(Icons.local_cafe, size: 72),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        "Café Espiritual",
                        style: GoogleFonts.poppins(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Center(
                    child: Container(
                      child: Text(
                        "Preencha os campos para continuar...",
                        style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 28,
                  ),
                  FormLogin(),
                  SizedBox(
                    height: 28,
                  ),
                  GestureDetector(
                    onTap: () {
                      Modular.to.pushNamed('/newuser');
                    },
                    child: Text(
                      "Criar novo usuário",
                      style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          letterSpacing: .5),
                    ),
                  )
                ],
              ),
            ),
            Observer(builder: (_) {
              return store.loading ? LoadingComponent() : Container();
            }),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Versão 1.0.0 (Beta)",
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            letterSpacing: .5)),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
