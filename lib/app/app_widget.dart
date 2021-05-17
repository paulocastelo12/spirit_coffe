import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: MaterialApp(
        title: 'Flutter Slidy',
        theme: ThemeData(
            // primarySwatch: Colors.green,
            brightness: Brightness.dark,
            primaryColor: Colors.grey[800],
            accentColor: Colors.green[300]),
        debugShowCheckedModeBanner: false,
      ).modular(),
    );
  }
}
