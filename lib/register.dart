import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'categories.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
 class register extends StatefulWidget {
   const register({Key? key}) : super(key: key);

   @override
   State<register> createState() => _registerState();
 }

 class _registerState extends State<register> {
   Future register(String name,String email,String password,String cpassword,String phone,String address,String age,String gender,int supplier)async{
     print('111');
     print("email $email");
     var response=await http.post(
       Uri.parse('http://192.168.43.169:8000/api/user/register'),
       body:<String,String>{
         'name':name,
         'email':email,
         'password':password,
         'password_confirmation':cpassword,
         'phone':phone,
         'state':address,
         'age':age,
         'gender':gender,
         'is_supplier':supplier.toString(),

       },
       headers:{
         "Accept":"application/json",

       }
     );
     print("response is ${response.body}");
     print("response is ${response.statusCode}");
     if(response.statusCode==200)
     {
       Navigator.pushReplacement(
         context,
         MaterialPageRoute(
           builder: (context) => categories(),
         ),
       );
       var js= jsonDecode (response.body);
       Token=js['token'];

     }
     else
     {
       print("sorry");
     }
   }
   var selectedgender;
   var formkey = GlobalKey<FormState>();
   var name=TextEditingController();
   var email=TextEditingController();
   var password=TextEditingController();
   var cpassword=TextEditingController();
   var phone=TextEditingController();
   var address=TextEditingController();
   var age=TextEditingController();
   var gender=TextEditingController();
   int is_supplier=0;
   bool male = false;
   bool female=false;

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: Color.fromRGBO(13,142,171, 1),
         title: Text('Register'.tr,style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700),),
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
                 controller: name,
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.abc,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Name'.tr,
                   hintStyle: TextStyle(fontFamily: 'Kalam')

                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your name'.tr;
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                 controller: email,
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
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return "Email Must Not Be Empty".tr;
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
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.lock_outline,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Password'.tr,
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 controller: password,
                 validator: (value){
                   if(value!.isEmpty){
                     return "Password Must Not Be Empty".tr;
                   }
                   if (value.length < 7) {
                     return "Password Must Be At Least 7 Characters".tr;
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
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.lock_outline,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Confirm Password'.tr,
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 controller: cpassword,
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please confirm your password'.tr;
                   }
                   if (value!=password.text){
                     return "Passwords don't match".tr;
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height:30),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                 controller: phone,
                 keyboardType: TextInputType.phone,
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.phone,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Phone'.tr,
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your number'.tr;
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                 controller: address,
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.home_outlined,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Address'.tr,
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your address'.tr;
                   }
                   return null;
                 } ,
               ),
             ),
             SizedBox(height: 30,),
             Padding(
               padding: const EdgeInsets.all(10.0),
               child: TextFormField(
                 controller: age,
                 keyboardType: TextInputType.number,
                 cursorColor: Color.fromRGBO(13,142,171, 1),
                 decoration: InputDecoration(
                     focusedBorder: OutlineInputBorder(
                       borderRadius: BorderRadius.circular(20),
                     ),
                     fillColor: Color.fromRGBO(201, 201, 201, 100),
                     filled: true,
                     prefixIcon: Icon(Icons.calendar_month_outlined,
                       color: Color.fromRGBO(13,142,171, 1),),
                     hintText: 'Age'.tr,
                     hintStyle: TextStyle(fontFamily: 'Kalam')
                 ),
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please enter your age'.tr;
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
                     color:Color.fromRGBO(13,142,171, 1) ,),SizedBox(width: 10,),Text("Gender".tr,  style:TextStyle(fontFamily: 'Kalam') )]),
                 isExpanded:true,
                 /*underline: Divider(color: Color.fromRGBO(90, 130, 95, 100),thickness: 2,),*/
                   items: ["male".tr,"female".tr].map((e) => DropdownMenuItem(child: Row(
                     children: [SizedBox(width: 10,),Icon(Icons.person,
                     color: Color.fromRGBO(13,142,171, 1),),SizedBox(width:10),
                       Text("$e".tr,style:TextStyle(fontFamily: 'Kalam')),
                     ],
                   ), value: e)).toList(), onChanged: (val){
                   setState(() {
                     selectedgender=val;
                     gender.text=val.toString();

                   });
                 },
               value: selectedgender,
               validator: (value) => value == null ? 'Please choose your gender'.tr : null,
             ),
           ),
             SizedBox(height: 30,),
             Container(
               padding: EdgeInsets.all(10),
               child: Row(
                 children: [
                   Text('supplier',style: TextStyle(
                     fontFamily: 'Kalam',fontSize: 30,color: Color.fromRGBO(13,142,171, 1),
                   ),),
                   Checkbox(value:is_supplier==1 , onChanged: (val){
                     setState(() {
                       is_supplier = val! ? 1:0;

                     });

                   },
                     activeColor:Color.fromRGBO(13,142,171, 1),),

                 ],
               ),
             ),
             SizedBox(height: 30,),
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
                        register(name.text,email.text,password.text,cpassword.text,phone.text,address.text,age.text,gender.text,is_supplier);
                       }
                   },
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Icon(Icons.login,
                         color: Colors.white,),
                       Text(' Sign Up'.tr,
                         style: TextStyle(
                           color: Colors.white,
                           fontWeight: FontWeight.w600,
                           fontSize: 19,
                         ),),
                     ],
                   ),
                 )),
             SizedBox(height: 30,),

           ],
         ),
       )
     );
   }
 }
