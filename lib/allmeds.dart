import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/addamed.dart';
import 'package:pharmacy_1/suppdrawer.dart';
import 'package:pharmacy_1/supplyinfo.dart';
import 'main.dart';
 class allmeds extends StatefulWidget {
   const allmeds({Key? key}) : super(key: key);

   @override
   State<allmeds> createState() => _allmedsState();
 }

 class _allmedsState extends State<allmeds> {
   List allmeds=[];
   Future getallMeds() async {
     var response = await http.get(Uri.parse('$url/api/user/asSupplier/medicine/all'),
         headers:<String,String>{
           'Authorization': 'Bearer $Token',
         });
     var responsebody=jsonDecode(response.body);
     setState(() {
       allmeds.addAll(responsebody);

     });

   }
   Future addsupply(String quantity,String expdate, suppID2)async {
     var response3 = await http.post(
         Uri.parse('$url/api/user/asSupplier/supply/add/$suppID2'),
         body: <String, String>
         {
           'quantity': quantity,
           'exp_date': expdate
         },

         headers:<String,String>{
           'Authorization': 'Bearer $Token',
         }
     );
     if(response3.statusCode==200){

       print("success");
       Navigator.of(context).pop();
     }
     else{
       openDialogue2(context);
     }

     ;
   }
   Future deletemed(int meddID) async{
     var response1 = await http.delete(Uri.parse('$url/api/user/asSupplier/medicine/delete/$meddID'),headers:<String,String>{
       'Authorization': 'Bearer $Token',
     });

     if (response1.statusCode==200){
       print("deleted");}
     else {
       print("error deleting");
       print(response1.body);
     }
   }
   var formkey = GlobalKey<FormState>();
   var QuantityController = TextEditingController();
   var ExpController = TextEditingController();
   Future openDialogue1(BuildContext context, int suppID2) =>
       showDialog(context: context, builder: (BuildContext context) =>
           AlertDialog(
             shape: RoundedRectangleBorder(),

             title: Text('Enter quantity and expiration date'),
             content: Column(children: [
               TextFormField(decoration: InputDecoration(hintText: 'Quantity'),controller: QuantityController,validator: (value){
                 if(value!.isEmpty){
                   return 'Please enter Quantity';
                 }
                 return null;
               } ,),
               TextFormField(decoration: InputDecoration(hintText: 'Exp Date: Y-M-D'),controller: ExpController,validator: (value){
                 if(value!.isEmpty){
                   return 'Please enter Exp Date';
                 }
                 return null;
               } ,)
             ],),
             actions: [TextButton(onPressed: () {
               Navigator.of(context).pop();
             }
                 , child: Text('Cancel')), TextButton(child: Text('Add Supply'),onPressed: ()=>addsupply(QuantityController.text, ExpController.text, suppID2)
                  )
             ],
           ));
   Icon cusIcon = Icon(Icons.search);
   bool ispressed=false;
   Widget cusBar= Text("All Medicines",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),);
   Widget cusSearch= TextFormField(
     cursorColor: Color.fromRGBO(13,142,171, 1),
     decoration: InputDecoration(
         fillColor: Color.fromRGBO(201, 201, 201, 100),
         filled: true,
         hintText: 'Search...'
     ),);
   @override
   void initState(){
     getallMeds();
     super.initState();

   }
   Widget build(BuildContext context) {
     double screenheight= MediaQuery.of(context).size.height;
     double screenwidth= MediaQuery.of(context).size.width;
     return Scaffold(
         drawer: sdrawer(),
         appBar: AppBar(title:Text("All Medicines",style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
           centerTitle: true,
           actions: [IconButton(icon: Icon(Icons.search),
       onPressed: (){},
     )],
           ),
         body:
         allmeds==null || allmeds.isEmpty? Center(child: CircularProgressIndicator()):
         ListView.builder(
             itemCount: allmeds[0].length
             ,itemBuilder: (context,i){
           return Dismissible(
             key: Key(i.toString()),
             direction: DismissDirection.endToStart,
             onDismissed: (direction){
               if (direction==DismissDirection.endToStart){
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content:Text('${allmeds[0][i]['name']} has been deleted')));
                 deletemed(allmeds[0][i]['id']);
               }
             },
             background: Container(color: Colors.red,child: Align(alignment: Alignment.centerRight,child: Padding(
               padding: EdgeInsets.all(screenwidth/8),
               child: Icon(Icons.delete,color: Colors.white,),
             ),)),
             child: GestureDetector(onTap: () {},
               child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),padding: EdgeInsets.all(screenheight/60),width: screenwidth,height: screenheight/5 ,child: ListView(physics: NeverScrollableScrollPhysics(),
                 children: [
                   Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(child: Image.network('${allmeds[0][i]['name']}'),height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${allmeds[0][i]['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Dosage Type: +${allmeds[0][i]['dosageForm']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${allmeds[0][i]['strength']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${allmeds[0][i]['ActiveIngredient']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Price: +${allmeds[0][i]['sellingPrice']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),RawMaterialButton(onPressed: (){openDialogue1(context, allmeds[0][i]['id']);},elevation: 2,fillColor: Color.fromRGBO(13,142,171, 1),child: Icon(Icons.add,color: Colors.white,size: screenwidth/16,),shape: CircleBorder(),)],))],),
                   SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
               ),),
             ),
           );

         }
         ),
       floatingActionButton: FloatingActionButton.extended(
         onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context) => addamed(),),);},
         backgroundColor: Color.fromRGBO(13,142,171, 1),
         label: const Text("Add a medicine")  ,
         icon: const Icon(Icons.medication_rounded,color: Colors.white,),
       ) ,

     );

   }
 }
Future openDialogue2(BuildContext context) =>
    showDialog(context: context, builder: (BuildContext context) =>
    AlertDialog(title: Text("Please enter valid information"),
      actions: [TextButton(onPressed: (){
        Navigator.of(context).pop();
      }, child: Text("ok"))],

     ));