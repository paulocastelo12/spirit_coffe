import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_coffe/app/modules/login/login_store.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  LoginStore _loginStore = Modular.get();

  final _formKey = GlobalKey<FormState>();

  MaskedTextController maskedTextController =
      MaskedTextController(mask: '(00) 00000-0000');

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Observer(builder: (_) {
                    var textEditingControllerName =
                        TextEditingController(text: _loginStore.nomeUser);

                    textEditingControllerName.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: textEditingControllerName.text.length));

                    return TextFormField(
                      controller: textEditingControllerName,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "NOME COMPLETO",
                        border: OutlineInputBorder(),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 10.0),
                      ),
                      style: GoogleFonts.poppins(fontSize: 18),
                      onChanged: _loginStore.setTextNomeUser,
                      validator: (value) {
                        if (value.isEmpty) return "O campo é obrigatório";
                        return null;
                      },
                      onSaved: (value) => _loginStore.nomeUser = value,
                    );
                  }),
                  SizedBox(
                    height: 24,
                  ),
                  Observer(builder: (_) {
                    maskedTextController.text = _loginStore.numberPhone;
                    TextEditingController textEditingControllerWithMask =
                        TextEditingController(text: maskedTextController.text);
                    textEditingControllerWithMask.selection =
                        TextSelection.fromPosition(TextPosition(
                            offset: maskedTextController.text.length));

                    return TextFormField(
                      controller: textEditingControllerWithMask,
                      keyboardType: TextInputType.number,
                      cursorColor: Colors.green,
                      decoration: InputDecoration(
                        labelText: "NÚMERO CELULAR",
                        border: OutlineInputBorder(),
                        contentPadding: new EdgeInsets.symmetric(
                            vertical: 16.0, horizontal: 10.0),
                      ),
                      style: GoogleFonts.poppins(fontSize: 18),
                      onChanged: _loginStore.setTextNumberPhone,
                      validator: (value) {
                        if (value.isEmpty) return "O campo é obrigatório";
                        return null;
                      },
                      onSaved: (value) => _loginStore.numberPhone = value,
                    );
                  }),
                  SizedBox(
                    height: 12,
                  ),
                  Observer(builder: (_) {
                    return Row(
                      children: [
                        Checkbox(
                          checkColor: Colors.white, // color of tick Mark
                          activeColor: Colors.green,
                          value: _loginStore.checkSave,
                          onChanged: (value) {
                            _loginStore.movimentcheck();
                          },
                        ),
                        Text(
                          'Manter-me conctado',
                          style: GoogleFonts.poppins(
                              fontSize: 16, letterSpacing: .5),
                        ),
                      ],
                    );
                  })
                ],
              )),
        ),
        SizedBox(
          height: 24,
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
