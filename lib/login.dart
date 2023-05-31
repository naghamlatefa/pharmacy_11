import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharmacy_1/register.dart';
import 'forget_password.dart';
import 'local/local_controller.dart';
import 'categories.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}
class _loginState extends State<login> {
  var formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    mylocalcontroller controllerlang=Get.find();
    return Scaffold(
      body: Form(
              key: formkey,
              child: ListView(
                children: <Widget> [
                  ClipPath(
                    child: Image(
                      image: AssetImage('assets/login.jpg'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      cursorColor: Color.fromRGBO(13,142,171, 1),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Color.fromRGBO(201, 201, 201, 100),
                          filled: true,
                          prefixIcon: Icon(Icons.email_outlined,
                            color: Color.fromRGBO(13,142,171, 1),),
                          hintText: 'Email'.tr,hintStyle: TextStyle(fontFamily:'Kalam',)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Email Must Not Be Empty'.tr;
                        }
                        return null;
                      } ,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      obscureText: true,
                      cursorColor: Color.fromRGBO(13,142,171, 1),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Color.fromRGBO(201, 201, 201, 100),
                          filled: true,
                          prefixIcon: Icon(Icons.lock_outline,
                            color: Color.fromRGBO(13,142,171, 1),),
                          hintText: 'Password'.tr,hintStyle: TextStyle(fontFamily:'Kalam',)
                      ),
                      validator: (value){
                        if(value!.isEmpty){
                          return 'Password Must Not Be Empty'.tr;
                        }
                        return null;
                      } ,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                            builder: (context) =>  forget_password(),
                        ),
                        );
                      }, child:
                      Text('Forgot Password  '.tr,
                        style: TextStyle(
                          fontSize: 12,
                            color: Color.fromRGBO(13,142,171, 1),fontFamily:'Kalam',
                        ),
                      ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(13,142,171, 1),
                      ),
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {
                          if(formkey.currentState!.validate()){
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => categories(),
                              ),
                            );

                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.login,
                              color: Colors.white,),
                            Text(' Login'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,fontFamily:'Kalam',
                              ),),
                          ],
                        ),
                      )),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t Have An Acount ?'.tr,style: TextStyle(fontFamily:'Kalam'),),
                      TextButton(onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> register()));
                      }, child:
                      Text('Register Now '.tr,
                        style: TextStyle(
                            color: Color.fromRGBO(13,142,171, 1),fontFamily:'Kalam',
                        ),
                      ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: () {
                        controllerlang.changelang("en");
                      },
                        child: Text('English'.tr,
                        style: TextStyle(
                            color: Color.fromRGBO(13,142,171, 1),fontFamily:'Kalam',
                        ),
                      ),
                      ),
                      TextButton(onPressed: () {
                        controllerlang.changelang("ar");
                      },
                        child: Text('Arabic'.tr,
                          style: TextStyle(
                              color: Color.fromRGBO(13,142,171, 1),fontFamily:'Kalam',
                          ),
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
    );
  }
}