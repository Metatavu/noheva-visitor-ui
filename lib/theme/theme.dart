import "package:flutter/material.dart";

/// Gets application theme
ThemeData getApplicationTheme() => ThemeData(
      inputDecorationTheme: const InputDecorationTheme(
        labelStyle: TextStyle(
          color: Color(0xff231F20),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xff231F20),
          ),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xff231F20),
          textStyle: const TextStyle(
            color: Color(0xffFCF7F7),
          ),
        ),
      ),
    );
