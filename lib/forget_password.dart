import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'new_password.dart';
import 'forget_password2.dart';
class forget_password extends StatefulWidget {
  const forget_password({Key ? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => forget_password2(),
                      ),
                    );
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
