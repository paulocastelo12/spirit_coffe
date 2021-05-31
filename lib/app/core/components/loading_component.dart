import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoadingComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> sentences = [
      "Estamos quase lá",
      "Falta pouco",
      "Se alcama-me",
      "Não vamos demorar"
    ];

    final _random = new Random();

    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF383838).withOpacity(0.6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(80)),
            height: 50,
            width: 50,
            child: Container(
                alignment: Alignment.center,
                child: CircularProgressIndicator()),
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            "${sentences[_random.nextInt(sentences.length)]}...",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontSize: 14,
                color: Colors.white,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.10),
          )
        ],
      ),
    );
  }
}
