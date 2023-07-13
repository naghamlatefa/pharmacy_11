import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
   bool is_supplier= false ;
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
                 controller: _pass,
                 validator: (value){
                   if(value!.isEmpty){
                     return "Password Must Not Be Empty".tr;
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
                 controller: _confirm,
                 validator: (value){
                   if(value!.isEmpty){
                     return 'Please confirm your password'.tr;
                   }
                   if (value!=_pass.text){
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
                   items: ["Male".tr,"Female".tr].map((e) => DropdownMenuItem(child: Row(
                     children: [SizedBox(width: 10,),Icon(Icons.person,
                     color: Color.fromRGBO(13,142,171, 1),),SizedBox(width:10),
                       Text("$e".tr,style:TextStyle(fontFamily: 'Kalam')),
                     ],
                   ), value: e)).toList(), onChanged: (val){
                   setState(() {
                     selectedgender=val;

                   });
                 },
                 value: selectedgender,
                     validator: (value) => value == null ? 'Please choose your gender'.tr : null),
           ),
             SizedBox(height: 30,),
             Container(
               padding: EdgeInsets.all(10),
               child: Row(
                 children: [
                   Text('supplier',style: TextStyle(
                     fontFamily: 'Kalam',fontSize: 30,color: Color.fromRGBO(13,142,171, 1),
                   ),),
                   Checkbox(value:is_supplier , onChanged: (val){
                     setState(() {
                       is_supplier = val!;
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
