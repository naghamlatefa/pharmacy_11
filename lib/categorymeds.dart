import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/addamed.dart';
import 'package:pharmacy_1/medinfo.dart';
import 'package:pharmacy_1/suppdrawer.dart';
import 'package:pharmacy_1/supplyinfo.dart';
import 'drawer.dart';
import 'main.dart';
class categorymeds extends StatefulWidget {
  const categorymeds({Key? key,required this.catID,required this.categoryname}) : super(key: key);
  final int catID;
  final String categoryname;

  @override
  State<categorymeds> createState() => _categorymedsState();
}

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
print(responsebody['medicines'][0]['name']);

 responsebody1=jsonDecode(response.body);
    });

  }


  late String categoryname=widget.categoryname;

  @override
  void initState(){

    getcatMeds();


    super.initState();

  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(title: Text('$categoryname',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(13,142,171, 1),
        actions: <Widget>[IconButton(icon: Icon(Icons.search),
          onPressed: (){},
        )]
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
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(child: Image.network(''),height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${responsebody1['medicines'][0]['medicine']['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Dosage Type: +${responsebody1['medicines'][0]['medicine']['dosageForm']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${responsebody1['medicines'][0]['medicine']['strength']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${responsebody1['medicines'][0]['medicine']['ActiveIngredient']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Price: +${responsebody1['medicines'][0]['medicine']['sellingPrice']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),],))],),
              SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
          ),),
        );

      }
      ),

    );

  }
}
