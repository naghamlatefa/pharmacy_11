import 'package:get/get.dart';
class Mylocal implements Translations{
  @override

  Map<String, Map<String, String>> get keys => {
    "ar":{
      " Login":"تسجيل الدخول","English":"انكليزي","Arabic":"عربي","Email":"الايميل","Email Must Not Be Empty":"الايميل لا يجب ان يكون فارغ",
"Password":"كلمة السر","Password Must Not Be Empty":"كلمة السر لا يجب ان تكون فارغة ","Forgot Password  ":"نسيان كلمة المرور","Don\'t Have An Acount ?":"ليس لديك حساب","Register Now ":"تسجيل الآن"
    },
    "en":{
      " Login" :"Login","English":"English","Arabic":"Arabic","Email":"Email","Email Must Not Be Empty":"Email Must Not Be Empty",
"Password":"Password","Password Must Not Be Empty":"Password Must Not Be Empty","Forgot Password  ":"Forgot Password",
      "Don\'t Have An Acount ?":"Don\'t Have An Acount ?","Register Now ":"Register Now "
    }
  };


}