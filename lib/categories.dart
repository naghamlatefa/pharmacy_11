import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:http/http.dart' as http;
import 'package:pharmacy_1/usersearch.dart';
import 'categorymeds.dart';
import 'test.dart';
import 'main.dart';

class categories extends StatefulWidget {

  const categories({Key? key}) : super(key: key);
  @override

  State<categories> createState() => _categoriesState();
}
var search=TextEditingController();
class _categoriesState extends State<categories> {

  Icon cusIcon = Icon(Icons.search);
  bool ispressed=false;
  Widget cusBar= Text("Categories".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),);
  Widget cusSearch= TextFormField(
    controller: search,
      cursorColor: Color.fromRGBO(13,142,171, 1),
      decoration: InputDecoration(
          fillColor: Color.fromRGBO(201, 201, 201, 100),
          filled: true,
          hintText: 'Search...'.tr,

      ),);
  @override
  void initState() {
    super.initState();

  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      drawer: drawer(),
      appBar: AppBar(title: ispressed? cusSearch:cusBar,
      centerTitle: true,
      backgroundColor:  Color.fromRGBO(13,142,171, 1),
     actions: [ispressed? Row(
       children: [IconButton(onPressed: (){
         if (search.text.isEmpty){
           openDialoguenosearch(context);
         }
         else{Navigator.push(
             context,
             MaterialPageRoute(
                 builder: (context) => usersearch(usearchinput:search.text)));}
       }, icon: Icon(Icons.arrow_forward_ios))
        , IconButton(icon: ispressed? Icon(Icons.cancel):Icon(Icons.search),
             onPressed: (){
            setState(() {
              ispressed= !ispressed;
            });
         } ),
       ],
     ):IconButton(icon: ispressed? Icon(Icons.cancel):Icon(Icons.search),
    onPressed: (){
    setState(() {
    ispressed= !ispressed;
    });
    })],
      ),
      body:ListView(
        padding: EdgeInsets.all(screenwidth/26),
        children: <Widget> [Container(padding: EdgeInsets.all(screenheight/128.5),height: screenheight/4.3,width: screenwidth/1.09,
          child: Stack(
            children:<Widget> [Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage( fit: BoxFit.fill,image:AssetImage('assets/welcome6.jpg'))),
            ),
           ],
          ),
        ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => categorymeds(catID: 1, categoryname: "Pain Relivers And Fever Reducers")));
              },
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/12.1),child:Text("Pain Relivers And Fever Reducers".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/48),)),height: screenwidth/2.35,width: screenwidth/2.35,
                    decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/fever2.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),

              ),

              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 2, categoryname: "Antiacids And Stomach Protection")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Antiacids And Stomach Protection".tr ,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/38.9),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/stomach.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 3, categoryname: "Anti-Allergics And Cold")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Anti-Allergics And Cold".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/cold.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 4, categoryname: "Lipid Reducers")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/10,screenwidth/13.3,screenwidth/13.3),child: Text("Lipid Reducers".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/lipids.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 5, categoryname: "Muscle Relaxants")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/6,screenwidth/13.3,screenwidth/13.3),child: Text("Muscle Relaxants".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/64.25),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/muscle.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 6, categoryname: "Hormonal Drugs")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/10,screenwidth/13.3,screenwidth/13.3),child: Text("Hormonal Drugs".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/hormones.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 7, categoryname: "Vitamins And Nutritional Supplements")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Vitamins And Nutritional Supplements".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/45.89),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/vitamins.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 8, categoryname: "Hygiene And Self-Care")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Hygiene And Self-Care".tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/shampoos.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),

          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 9, categoryname: "Antibiotics")));},
                child: Stack(
                  children: [
                      Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/7,screenwidth/13.3,screenwidth/13.3),child: Text("Antibiotics".tr ,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/42.8),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/bacteria.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),

              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 10, categoryname: "Antidepressants")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.fromLTRB(screenwidth/13.3,screenwidth/7,screenwidth/13.3,screenwidth/13.3),child: Text("Antidepressants".tr ,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/58.4),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/depression.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: screenheight/32.125),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              GestureDetector(onTap: (){ Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => categorymeds(catID: 11, categoryname: "Creams And Ointments")));},
                child: Stack(
                  children: [
                    Container(child:  Container(margin:EdgeInsets.all(screenwidth/13.3),child: Text("Creams And Ointments".tr ,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,fontSize: screenheight/36.7),)),height: screenwidth/2.35,width: screenwidth/2.35,
                      decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/creams.jpg')),borderRadius: BorderRadius.circular(30),color:Color.fromRGBO(90, 130, 95, 100) ),
                    ),
                  ],
                ),
              ),


            ],
          )
        ],
      ),

    );
  }
}
Future openDialoguenosearch(BuildContext context) =>
    showDialog(context: context, builder: (BuildContext context) =>
        AlertDialog(title: Text("Please type something"),
          actions: [TextButton(onPressed: (){
            Navigator.of(context).pop();
          }, child: Text("ok"))],

        ));
