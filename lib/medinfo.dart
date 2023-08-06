import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/provider/dark_theme_provider.dart';
import 'package:provider/provider.dart';
import 'comments.dart';
import 'main.dart';
class medinfo extends StatefulWidget {

  const medinfo({Key? key,required this.MedID}) : super(key: key);
  final int MedID;


  @override
  State<medinfo> createState() => _medinfoState();
}

class _medinfoState extends State<medinfo> {
  List Umedinfo=[];
  var MedInfo;


  Future getmedinfo() async {
    var response = await http.get(Uri.parse('$url/api/user/show_medicines/${widget.MedID}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      Umedinfo.add(responsebody);
      MedInfo=responsebody;
      print(responsebody[0]['id']);

    });

  }
  @override
  void initState(){

    getmedinfo();

    super.initState();
  }

  Widget build(BuildContext context) {

    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(


        backgroundColor: Color.fromRGBO(13,142,171, 1),
        title: Text('Medicine Info',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
      ),
      body: MedInfo==null || MedInfo.isEmpty? Center(child: CircularProgressIndicator()):
      Container(padding: EdgeInsets.all(screenheight/60),
        child: ListView(
          children: [
            Container(height: screenwidth/1.5,width: screenwidth/1.5,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),image: DecorationImage(fit: BoxFit.fill,image: AssetImage('assets/fakemeds.jpg'))),),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  ${MedInfo[0]['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/40,fontFamily: 'Kalam',fontWeight: FontWeight.bold))),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Active Ingredient: ${MedInfo[0]['ActiveIngredient']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text(' Selling Price: ${MedInfo[0]['sellingPrice']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Dosage: ${MedInfo[0]['strength']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Dosage Form:${MedInfo[0]['dosageForm']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
            SizedBox(height:screenheight/138,),
            Container(decoration: BoxDecoration(color: Color.fromRGBO(35, 33, 30, 0.1),borderRadius: BorderRadius.circular(30)),child:Text('  Details: ${MedInfo[0]['about']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/55,fontFamily: 'Kalam'))),
            SizedBox(height:screenheight/138,),
            RawMaterialButton(onPressed: (){},shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,fillColor:Color.fromRGBO(13,142,171, 1) ,child: Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [ Icon(Icons.shopping_cart,
                color: Colors.white,),
                Text(" Add To Cart",style:TextStyle(fontFamily: 'kalam',color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400),),
              ],
            )),
            SizedBox(height:screenheight/138,),
            RawMaterialButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => comments(medID1:MedInfo[0]['id'] ,)));
            },shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)) ,fillColor:Color.fromRGBO(13,142,171, 1) ,child: Row(
              mainAxisAlignment: MainAxisAlignment.center,children: [ Icon(Icons.comment,
              color: Colors.white,),
              Text(" Comments",style:TextStyle(fontFamily: 'kalam',color: Colors.white,fontSize: 19,fontWeight: FontWeight.w400),),
            ],
            ))


          ],
        ),
      ),

    );

  }
}
