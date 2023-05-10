import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        color: Colors.white,
        child: Material(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              children: [
                ClipPath(
                  child: Image(
                    image: AssetImage('assets/login1.jpg'),
                  ),
                ),
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
                        hintText: 'Email'
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
                        hintText: 'Password'
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
                          Icon(Icons.login,
                            color: Colors.white,),
                          Text(' Login',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),),
                        ],
                      ),
                    )),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t Have An Acount ?'),
                    TextButton(onPressed: () {}, child:
                    Text('Register Now ',
                      style: TextStyle(
                          color: Color.fromRGBO(90, 130, 95, 100)
                      ),
                    ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),

    );
  }
}