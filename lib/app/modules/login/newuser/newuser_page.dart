import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:spirit_coffe/app/core/components/loading_component.dart';
import 'package:spirit_coffe/app/modules/login/newuser/newuser_store.dart';
import 'package:flutter/material.dart';

class NewuserPage extends StatefulWidget {
  final String title;
  const NewuserPage({Key key, this.title = 'Novo usuário'}) : super(key: key);
  @override
  NewuserPageState createState() => NewuserPageState();
}

class NewuserPageState extends State<NewuserPage> {
  final NewuserStore store = Modular.get();

  final _formKey = GlobalKey<FormState>();

  MaskedTextController maskedTextphone =
      MaskedTextController(mask: '(00) 00000-0000');

  MaskedTextController maskedTextbirthday =
      MaskedTextController(mask: '00/00/0000');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: GoogleFonts.poppins(fontSize: 18),
        ),
      ),
      body: SingleChildScrollView(
          child: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(left: 24, right: 24, top: 12),
                child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: NewUserTextFormField(
                              labelText: "NOME COMPLETO",
                              onsave: (value) => store.name = value),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: NewUserTextFormField(
                              labelText: "DATA NASCIMENTO",
                              onsave: (value) => store.datebirthday = value,
                              controller: maskedTextbirthday,
                              textInputType: TextInputType.datetime),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: NewUserTextFormField(
                              labelText: "NÚMERO CELULAR",
                              onsave: (value) => store.phone = value,
                              controller: maskedTextphone,
                              textInputType: TextInputType.number),
                        ),
                        Observer(builder: (_) {
                          return Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      'Masculino',
                                      style: GoogleFonts.poppins(fontSize: 16),
                                    ),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.masculine,
                                      groupValue: store.gender,
                                      onChanged: store.setGender,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: ListTile(
                                    title: Text(
                                      'Feminino',
                                      style: GoogleFonts.poppins(fontSize: 16),
                                    ),
                                    leading: Radio<SingingCharacter>(
                                      value: SingingCharacter.feminine,
                                      groupValue: store.gender,
                                      onChanged: store.setGender,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                        SizedBox(height: 28),
                        GestureDetector(
                          onTap: () {
                            final isValid = _formKey.currentState.validate();

                            if (isValid) {
                              _formKey.currentState.save();
                              store.savenewuser();
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
                                "CRIAR USUÁRIO",
                                style: GoogleFonts.poppins(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: .5),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )),
              )
            ],
          ),
          Observer(builder: (_) {
            return store.loading ? LoadingComponent() : Container();
          }),
        ],
      )),
    );
  }
}

class NewUserTextFormField extends StatelessWidget {
  final String labelText;
  final onsave;
  final controller;
  final TextInputType textInputType;

  const NewUserTextFormField({
    Key key,
    this.labelText,
    this.onsave,
    this.controller,
    this.textInputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      cursorColor: Colors.green,
      keyboardType: textInputType,
      decoration: InputDecoration(
        labelText: labelText,
        border: OutlineInputBorder(),
        contentPadding:
            new EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
      ),
      style: GoogleFonts.poppins(fontSize: 18),
      validator: (value) {
        if (value.isEmpty) return "O campo é obrigatório";
        return null;
      },
      onSaved: onsave,
    );
  }
}
