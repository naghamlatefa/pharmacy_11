import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:pharmacy_1/categories.dart';
import 'package:pharmacy_1/login.dart';
import 'package:pharmacy_1/show_medicine.dart';
import 'local/local_controller.dart';
import 'local/local.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Get.put(mylocalcontroller());
    return ChangeNotifierProvider(create: (context){
      return cart();
    },
    child: GetMaterialApp(
        debugShowCheckedModeBanner: false ,
        home: login(),
      locale: Get.deviceLocale,
      translations : Mylocal(),
    ),
    );

  }

}
