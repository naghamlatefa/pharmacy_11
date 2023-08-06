import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/login.dart';
import 'forget_password.dart';
class new_passoword extends StatefulWidget {
  const new_passoword({Key? key}) : super(key: key);

  @override
  State<new_passoword> createState() => _new_passowordState();
}

class _new_passowordState extends State<new_passoword> {
  final TextEditingController _pass= TextEditingController();
  final TextEditingController _confirm= TextEditingController();
  var formkey =GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13,142,171, 1),
      ),
      body:Form(
        key: formkey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _pass,
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
                      hintText: ' New Password'.tr,
                    hintStyle: TextStyle(
                        fontFamily:'Kalam'
                    )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return  "Password Must Not Be Empty".tr;
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  controller: _confirm,
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
                      hintText: 'Confirm New Password'.tr,
                    hintStyle: TextStyle(
                        fontFamily:'Kalam'
                    )
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return  "Password Must Not Be Empty".tr;
                    }
                    if (value!=_pass.text){
                      return "Passwords don't match".tr;
                    }
                    return null;
                  },
                ),
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
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  login(),
                          ),
                        );


                      }
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(' Done '.tr,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 19,
                              fontFamily:'Kalam'
                          ),),
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),



    );
  }
}


