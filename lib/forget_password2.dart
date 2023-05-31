import 'package:flutter/material.dart';
import 'new_password.dart';
class forget_password2 extends StatefulWidget {
  const forget_password2({Key ? key}) : super(key: key);

  @override
  State<forget_password2> createState() => _forget_password2State();
}

class _forget_password2State extends State<forget_password2> {
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
              keyboardType: TextInputType.phone,
              cursorColor: Color.fromRGBO(13,142,171, 1),
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  fillColor: Color.fromRGBO(201, 201, 201, 100),
                  filled: true,
                  prefixIcon: Icon(Icons.verified,
                    color: Color.fromRGBO(13,142,171, 1),),
                  hintText: 'Code Verification ',
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
