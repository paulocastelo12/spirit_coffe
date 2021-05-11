import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:spirit_coffe/app/modules/login/login_store.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  LoginStore _loginStore = Modular.get();

  final _formKey = GlobalKey<FormState>();

  var maskFormatter = new MaskTextInputFormatter(
      mask: '(##) #####-####', filter: {"#": RegExp(r'[0-9]')});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: "NOME COMPLETO",
                      border: OutlineInputBorder(),
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 10.0),
                    ),
                    style: GoogleFonts.poppins(fontSize: 18),
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      return null;
                    },
                   onSaved: (value) => _loginStore.nomeUser = value,
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  TextFormField(
                    inputFormatters: [maskFormatter],
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "NÚMERO CELULAR",
                      border: OutlineInputBorder(),
                      contentPadding: new EdgeInsets.symmetric(
                          vertical: 16.0, horizontal: 10.0),
                    ),
                    style: GoogleFonts.poppins(fontSize: 18),
                    validator: (value) {
                      if (value.isEmpty) return "O campo é obrigatório";
                      return null;
                    },
                    onSaved: (value) => _loginStore.numberPhone = value,
                  ),
                ],
              )),
        ),
        SizedBox(
          height: 48,
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
            final isValid = _formKey.currentState.validate();

            if (isValid) {
              _formKey.currentState.save();
              _loginStore.login();
            }
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 48,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  Colors.green,
                  Colors.green[400],
                ]),
                borderRadius: BorderRadius.circular(8)),
            child: Center(
              child: Text(
                "ENTRAR",
                style: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    letterSpacing: .5),
              ),
            ),
          ),
        )
      ],
    );
  }
}
