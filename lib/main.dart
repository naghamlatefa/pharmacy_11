
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pharmacy_1/categories.dart';
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

    );

  }

}
