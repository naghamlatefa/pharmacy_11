
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_1/categories.dart';
import 'package:pharmacy_1/local/language.dart';
import 'package:pharmacy_1/login.dart';
import 'package:pharmacy_1/show_medicine.dart';
import 'show_medicine.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
        debugShowCheckedModeBanner: false ,
        home: categories(),
      localizationsDelegates: [
        AppLocale.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        Locale("en", ""),
        Locale("ar" , ""),
      ],
      localeResolutionCallback: (currentlang , supportlang) {
        if (currentlang != null) {
          for (Locale locale in supportlang) {
            if (locale.languageCode == currentlang.languageCode){
              return currentlang;
            }
          }
          return supportlang.first;
        }
      }
    );

  }

}
