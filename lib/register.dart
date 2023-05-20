import 'package:flutter/material.dart';
import 'login.dart';
import 'categories.dart';
 class register extends StatefulWidget {
   const register({Key? key}) : super(key: key);

   @override
   State<register> createState() => _registerState();
 }

 class _registerState extends State<register> {
   var selectedgender;
   var formkey = GlobalKey<FormState>();
   final TextEditingController _pass= TextEditingController();
   final TextEditingController _confirm= TextEditingController();
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Color.fromRGBO(90, 130, 95, 100),
         title: Text('Register'),
         centerTitle: true,
       ),
       body: Form(
         key:formkey,
         child: ListView(
           children: <Widget> [
             SizedBox(height:30),
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
                     prefixIcon: Icon(Icons.abc,
                       color: Color.fromRGBO(90, 130, 95, 100),),
                     hintText: 'Name'
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your name';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
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
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your Email';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
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
                 controller: _pass,
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter a password';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height:30),
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
                     hintText: 'Confirm Password'
                 ),
                 controller: _confirm,
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please confirm your password';
                   }
                   if (value!=_pass.text){
                     return "Passwords don't match";
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height:30),
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
                     prefixIcon: Icon(Icons.phone,
                       color: Color.fromRGBO(90, 130, 95, 100),),
                     hintText: 'Email'
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your number';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
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
                     prefixIcon: Icon(Icons.home_outlined,
                       color: Color.fromRGBO(90, 130, 95, 100),),
                     hintText: 'Address'
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your address';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                 keyboardType: TextInputType.number,
                 cursorColor: Color.fromRGBO(90, 130, 95, 100),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.calendar_month_outlined,
                       color: Color.fromRGBO(90, 130, 95, 100),),
                     hintText: 'Age'
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your age';
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height:30),
           Container(margin: EdgeInsets.symmetric(horizontal: 10),
             child: DropdownButtonFormField(
               dropdownColor: Color.fromRGBO(201, 201, 201, 1),
               decoration: InputDecoration(
                 filled: true,
                 fillColor: Color.fromRGBO(201, 201, 201, 100),
                 enabledBorder:OutlineInputBorder(borderSide: BorderSide(color:Colors.black87,width:1),borderRadius: BorderRadius.circular(5)),
                 focusedBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.black,width:1))
               ),
                 hint:  Row(
                     children:<Widget> [SizedBox(width:10),Icon(Icons.person,
                     color:Color.fromRGBO(90, 130, 95, 100) ,),SizedBox(width: 10,),Text("Gender")]),
                 isExpanded:true,
                 /*underline: Divider(color: Color.fromRGBO(90, 130, 95, 100),thickness: 2,),*/
                   items: ["Male","Female"].map((e) => DropdownMenuItem(child: Row(
                     children: [SizedBox(width: 10,),Icon(Icons.person,
                     color: Color.fromRGBO(90, 130, 95, 100),),SizedBox(width:10),
                       Text("$e"),
                     ],
                   ), value: e)).toList(), onChanged: (val){
                   setState(() {
                     selectedgender=val;

                   });
                 },
                 value: selectedgender,
                     validator: (value) => value == null ? 'Please choose your gender' : null),
           ),
             SizedBox(height: 30,),
             Container(
                 margin: EdgeInsets.symmetric(horizontal: 60),
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Color.fromRGBO(90, 130, 95, 100),
                 ),
                 child: MaterialButton(
                   height: 50,
                   onPressed: () {
                     if(formkey.currentState!.validate()){
                       Navigator.push(
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
                       Text(' Sign Up',
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                           fontSize: 19,
                         ),),
                     ],
                   ),
                 )),
             SizedBox(height: 30,),
             SizedBox(height: 300,width: 300,
               child: ClipPath(
                 child: Image(
                   image: AssetImage('assets/login1.jpg'),
                 ),
               ),
             ),
           ],
         ),
       )
     );
   }
 }
