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
import 'drawer.dart';
import 'main.dart';
class usersearch extends StatefulWidget {
  const usersearch({Key? key,required this.usearchinput}) : super(key: key);
  final String usearchinput;


  @override
  State<usersearch> createState() => _usersearchState();
}

class _usersearchState extends State<usersearch> {

  var searchresults;

  Future getusearchresults() async {
    var response = await http.get(Uri.parse('$url/api/user/search/${widget.usearchinput}'),
        headers:<String,String>{
          'Authorization': 'Bearer $Token',
        });
    var responsebody=jsonDecode(response.body);
    setState(() {

     var searchresults2=jsonDecode(response.body);
     searchresults=searchresults2;

print(responsebody);
      print('json is ${searchresults['medicines'].length}');

    });

  }




  @override
  void initState(){
    getusearchresults();
    super.initState();

  }
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    final themeState = Provider.of<DarkThemeProvider>(context);
    return Scaffold(

      appBar: AppBar(title: Text('Search Result',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
        centerTitle: true,
        backgroundColor:  Color.fromRGBO(13,142,171, 1),

      ),
      body:
      searchresults==null || searchresults.isEmpty? Center(child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: searchresults['medicines'].length
          ,itemBuilder: (context,i){
        return GestureDetector(onTap: () {Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => medinfo(MedID:searchresults['medicines'][i]['id'] )));},
          child: Container(color: Color.fromRGBO(35, 33, 30, 0.1),padding: EdgeInsets.all(screenheight/60),width: screenwidth,height: screenheight/5 ,child: ListView(physics: NeverScrollableScrollPhysics(),
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.start,children: [Container(child: Image.asset('assets/fakemeds.jpg',fit: BoxFit.fill,),height: screenheight/6,width: screenwidth/4,decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),),SizedBox(width: screenwidth/25,),Container(width: screenwidth/3,child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,children: [Text('${searchresults['medicines'][i]['name']}',style: TextStyle(color:  Color.fromRGBO(13,142,171, 1),fontSize: screenheight/48,fontFamily: 'Kalam',fontWeight: FontWeight.bold),),Text('Dosage Type: +${searchresults['medicines'][i]['dosageForm']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Dosage: +${searchresults['medicines'][i]['strength']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam')),Text('Active Ingredient: +${searchresults['medicines'][i]['ActiveIngredient']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam'))],)),Container(width: screenwidth/4,child: Column(crossAxisAlignment: CrossAxisAlignment.end,mainAxisAlignment: MainAxisAlignment.center,children: [Text('Price: +${searchresults['medicines'][i]['sellingPrice']}',style: TextStyle(color:themeState.getDarkTheme?Colors.white :Colors.black,fontSize: screenheight/90,fontFamily: 'Kalam',fontWeight:FontWeight.bold )),SizedBox(height: screenheight/138,),],))],),
              SizedBox(height: screenheight/138,),Divider(color: Color.fromRGBO(13,142,171, 1),)],
          ),),
        );

      }
      ),

    );

  }
}
