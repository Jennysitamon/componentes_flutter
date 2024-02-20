//Definicion de los temas de estilo de la app
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme{
  //constante de un color primario
  static const primaryColor = Color.fromARGB(223, 161, 72, 179);
  //constante de un color secundario
  static const secondaryColor = Color.fromARGB(255, 211, 106, 141); 
  //constante de color de fondo
  static const backColor = Color.fromARGB(227, 165, 206, 209);
  //constante de tema
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: backColor,
        appBarTheme: const AppBarTheme(
          color: primaryColor,
      ),
      textTheme: TextTheme(
        //Titulos muy grandes
        headlineLarge: GoogleFonts.dancingScript(
          color: primaryColor,
          fontSize: 26.5,
          fontWeight: FontWeight.w500,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: primaryColor,
          decorationStyle: TextDecorationStyle.dotted,
          decorationThickness: 2.0,
        ),
        //Estilo para texto muy pequeño
        bodySmall: GoogleFonts.shadowsIntoLight(
          color: secondaryColor,
          fontSize: 16.0,
        ),
      ),
  );

}