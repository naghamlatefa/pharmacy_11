import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/main.dart';
import 'forget_password2.dart';
import 'main.dart';
import 'package:http/http.dart' as http;
class forget_password extends StatefulWidget {
  const forget_password({Key ? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  Future email(String email)async{
    print("111");

    print("enaillllll$email");
    var response = await http.post(
        Uri.parse('$url/api/user/password/email'),
        body:<String,String>
        {
          'email':email,
        },
        headers: {"Accept":"application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $Token'

        }
    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if(response.statusCode==201)
    {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('the code sent to your Email')));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => forget_password2(),
        ),
      );
      var js=jsonDecode(response.body);
      Token=js['token'];

    }
    else
    {
      print("sorry");
    }
  }
  var emaill = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13,142,171, 1),
      ),
        body:Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                controller: emaill,
                cursorColor: Color.fromRGBO(13,142,171, 1),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color.fromRGBO(201, 201, 201, 100),
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined,
                      color: Color.fromRGBO(13,142,171, 1),),
                    hintText: 'Email'.tr,
                    hintStyle: TextStyle(
                    fontFamily:'Kalam'
                )
                ),
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
                    email(emaill.text);

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



    );
  }
}
