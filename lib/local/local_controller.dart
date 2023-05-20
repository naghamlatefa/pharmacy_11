import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';

class mylocalcontroller extends GetxController{
  void changelang (String codelang){
    Locale local=Locale(codelang);
    Get.updateLocale(local);

  }
}