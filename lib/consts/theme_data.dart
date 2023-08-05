import 'package:flutter/material.dart';
Color drawercolor=Color.fromRGBO(14, 40, 63, 1);
class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context){
    return ThemeData(
      scaffoldBackgroundColor: isDarkTheme? Color.fromRGBO(14, 40, 63, 1):Colors.white,
      );

  }
}