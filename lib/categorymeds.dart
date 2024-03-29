import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/addamed.dart';
import 'package:pharmacy_1/medinfo.dart';
import 'package:pharmacy_1/provider/dark_theme_provider.dart';
import 'package:pharmacy_1/suppdrawer.dart';
import 'package:pharmacy_1/supplyinfo.dart';
import 'package:provider/provider.dart';
import 'cusearch.dart';
import 'drawer.dart';
import 'main.dart';
class categorymeds extends StatefulWidget {
  const categorymeds({Key? key,required this.catID,required this.categoryname}) : super(key: key);
  final int catID;
  final String categoryname;

  @override
  State<categorymeds> createState() => _categorymedsState();
}
var search=TextEditingController();

class _categorymedsState extends State<categorymeds> {
  var responsebody1;
List catmeds=[];

  Future getcatMeds() async {
    var response = await http.get(Uri.parse('$url/api/user/show_category_med/${widget.catID}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      responsebody1=jsonDecode(response.body);
      print(responsebody);
    });


  }


  late String categoryname=widget.categoryname;


  Icon cusIcon = Icon(Icons.search);
  bool ispressed=false;
  Widget cusBar= Text('Medicines',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),);
  Widget cusSearch= TextFormField(
    controller: search,
    cursorColor: Color.fromRGBO(13,142,171, 1),
    decoration: InputDecoration(
        fillColor: Color.fromRGBO(201, 201, 201, 100),
        filled: true,
        hintText: 'Search...'
    ),);
  @override
  void initState(){

    getcatMeds();


    super.initState();

  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(

      appBar: AppBar(title: ispressed? cusSearch:Text('$categoryname',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(13,142,171, 1),
        actions: [ispressed? Row(
          children: [IconButton(onPressed: (){
            if (search.text.isEmpty){openDialoguenosearch(context);}
            else
           { Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => cusersearch(cusearchinput:search.text,catID2:widget.catID )));}
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
      body:
      responsebody1==null || responsebody1.isEmpty? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: responsebody1['medicines'].length
          ,itemBuilder: (context,i){
        return GestureDetector(onTap: () {Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => medinfo(MedID:responsebody1['medicines'][i]['medicine']['id'] )));},
          child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),padding: EdgeInsets.all(screenheight/60),width: screenwidth,height: screenheight/5 ,child: ListView(physics: NeverScrollableScrollPhysics(),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(child: Image.asset('assets/fakemeds.jpg'),height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${responsebody1['medicines'][i]['medicine']['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Dosage Type: +${responsebody1['medicines'][i]['medicine']['dosageForm']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${responsebody1['medicines'][i]['medicine']['strength']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${responsebody1['medicines'][i]['medicine']['ActiveIngredient']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Price: +${responsebody1['medicines'][i]['medicine']['sellingPrice']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),],))],),
              SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
          ),),
        );

      }
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