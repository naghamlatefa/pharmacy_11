import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'main.dart';
 class suppinfo extends StatefulWidget {

   const suppinfo({Key? key,required this.suppID}) : super(key: key);
   final int suppID;


   @override
  State<suppinfo> createState() => _suppinfoState();
}

class _suppinfoState extends State<suppinfo> {
   List Smedinfo=[];


  Future getsupplyinfo() async {
    var response = await http.get(Uri.parse('$url/api/user/asSupplier/supply/show/${widget.suppID}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      Smedinfo.add(responsebody);

      print(responsebody);

    });

  }
   @override
   void initState(){

     getsupplyinfo();

     super.initState();
   }

   Widget build(BuildContext context) {

     double screenheight= MediaQuery.of(context).size.height;
     double screenwidth= MediaQuery.of(context).size.width;
     return Scaffold(
       appBar: AppBar(


         backgroundColor: Color.fromRGBO(13,142,171, 1),
         title: Text('Product Info',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
         centerTitle: true,
       ),
       body: Smedinfo==null || Smedinfo.isEmpty? Center(child: CircularProgressIndicator()):
       Container(padding: EdgeInsets.all(screenheight/60),
         child: ListView(
           children: [
             Container(height: screenwidth/1.5,width: screenwidth/1.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/panadol.jpg'))),),
            SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  ${Smedinfo[0]['supply']['medicine']['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/40,fontFamily: 'Kalam',fontWeight: FontWeight.bold))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Active Ingredient: ${Smedinfo[0]['supply']['medicine']['ActiveIngredient']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Quantity: ${Smedinfo[0]['supply']['quantity']} Selling Price: ${Smedinfo[0]['supply']['medicine']['sellingPrice']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Dosage: ${Smedinfo[0]['supply']['medicine']['strength']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Dosage Form:${Smedinfo[0]['supply']['medicine']['dosageForm']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Details: ${Smedinfo[0]['supply']['medicine']['about']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Row(children: [Text('  Created At:',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/55,fontFamily: 'Kalam')),Text('  ${Smedinfo[0]['supply']['medicine']['created_at']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam')),],)),
             SizedBox(height:screenheight/138,),
             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Row(children: [Text('  Updated:',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/55,fontFamily: 'Kalam')),Text('  ${Smedinfo[0]['supply']['medicine']['updated_at']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam')),],)),
             SizedBox(height:screenheight/138,),

             Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Row(children: [Text('  Expiration Date:',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/55,fontFamily: 'Kalam')),Text('  ${Smedinfo[0]['supply']['exp_date']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam')),],)),
           ],
         ),
       ),

     );
   }
}
