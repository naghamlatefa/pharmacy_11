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
class cusersearch extends StatefulWidget {
  const cusersearch({Key? key,required this.cusearchinput,required this.catID2}) : super(key: key);
  final String cusearchinput;
  final int catID2;


  @override
  State<cusersearch> createState() => _cusersearchState();
}

class _cusersearchState extends State<cusersearch> {
  var responsebody1;
  List searchresults=[];

  Future getusearchresults() async {
    var response = await http.get(Uri.parse('$url/api/user/search_category/${widget.catID2}/${widget.cusearchinput}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {
      searchresults.addAll(responsebody);
    });

  }




  @override
  void initState(){

    getusearchresults();

    print(searchresults);
    super.initState();

  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(

      appBar: AppBar(title: Text('Search Result',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(13,142,171, 1),

      ),
      body:
      searchresults==null || searchresults.isEmpty? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: searchresults[0].length
          ,itemBuilder: (context,i){
        return GestureDetector(onTap: () {Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => medinfo(MedID:searchresults[0][i]['id'] )));},
          child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),padding: EdgeInsets.all(screenheight/60),width: screenwidth,height: screenheight/5 ,child: ListView(physics: NeverScrollableScrollPhysics(),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(child: Image.network(''),height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${searchresults[0][i]['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Dosage Type: +${searchresults[0][i]['dosageForm']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${searchresults[0][i]['strength']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${searchresults[0][i]['ActiveIngredient']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Price: +${searchresults[0][i]['sellingPrice']}',style: TextStyle(color:  Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),],))],),
              SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
          ),),
        );

      }
      ),

    );

  }
}
