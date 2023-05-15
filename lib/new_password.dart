import 'package:flutter/material.dart';
import 'forget_password.dart';
class new_passoword extends StatefulWidget {
  const new_passoword({Key? key}) : super(key: key);

  @override
  State<new_passoword> createState() => _new_passowordState();
}

class _new_passowordState extends State<new_passoword> {
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
              obscureText: true,
              cursorColor: Color.fromRGBO(90, 130, 95, 100),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(90, 130, 95, 100),),
                  hintText: ' New Password'
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextFormField(
              obscureText: true,
              cursorColor: Color.fromRGBO(90, 130, 95, 100),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.lock_outline,
                    color: Color.fromRGBO(90, 130, 95, 100),),
                  hintText: 'Confirm New Password'
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
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(' OK ',
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


