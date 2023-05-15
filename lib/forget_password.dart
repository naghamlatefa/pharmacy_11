import 'package:flutter/material.dart';
import 'new_password.dart';
class forget_password extends StatefulWidget {
  const forget_password({Key? key}) : super(key: key);

  @override
  State<forget_password> createState() => _forget_passwordState();
}

class _forget_passwordState extends State<forget_password> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(90, 130, 95, 100),
      ),
        body:Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                cursorColor: Color.fromRGBO(90, 130, 95, 100),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color.fromRGBO(201, 201, 201, 100),
                    filled: true,
                    prefixIcon: Icon(Icons.email_outlined,
                      color: Color.fromRGBO(90, 130, 95, 100),),
                    hintText: 'Gmail'
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                keyboardType: TextInputType.phone,
                cursorColor: Color.fromRGBO(90, 130, 95, 100),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Color.fromRGBO(201, 201, 201, 100),
                    filled: true,
                    prefixIcon: Icon(Icons.verified,
                      color: Color.fromRGBO(90, 130, 95, 100),),
                    hintText: 'Code Verification '
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
                  color: Color.fromRGBO(90, 130, 95, 100),
                ),
                child: MaterialButton(
                  height: 50,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => new_passoword(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(' Done ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,
                        ),),
                    ],
                  ),
                )),
          ],
        ),



    );
  }
}
