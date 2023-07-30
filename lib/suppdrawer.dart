import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:pharmacy_1/cart_shopping.dart';
import 'package:pharmacy_1/providerstorage.dart';
import 'package:pharmacy_1/reminders.dart';
import 'package:pharmacy_1/categories.dart';
import 'package:http/http.dart' as http;
import 'allmeds.dart';
import 'login.dart';
import 'main.dart';

class sdrawer extends StatefulWidget {
  const sdrawer({Key? key}) : super(key: key);

  @override
  State<sdrawer> createState() => _sdrawerState();
}

class _sdrawerState extends State<sdrawer> {
  Future logout()async{
    print(Token);
    print("before");
    var response=await http.post(
      Uri.parse('$url/api/user/logout'),
      headers:<String,String>{
        "Accept":"application/json",
        'Authorization':'Bearer $Token',
      },
      body: jsonEncode(<String,dynamic>{

      }),

    );
    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if(response.statusCode==200){
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => login(),
        ),
      );
      //var js=jsonDecode(response.body);
      //Token=js['access_token'];
    }
    else{
      print("sorry");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(accountName: Text('Supplier',style: TextStyle(fontFamily: 'Kalam',fontSize: 30),), accountEmail: Text('Pharmalytics',style: TextStyle(fontFamily: 'Kalam',fontSize: 25)),
              decoration: BoxDecoration(color: Color.fromRGBO(13,142,171, 1)),),
            Container(color: pagenumber==1?Color.fromRGBO(13,142,171, 1):Colors.transparent,
              child: ListTile(onTap: (){setState(() {
                pagenumber=1;
                Navigator.push(context, MaterialPageRoute(builder: (context) => provstorage(),),);
              });},
                leading: Icon(Icons.indeterminate_check_box_outlined,color: Colors.black,)
                ,title: Text('Storage',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
              ),
            )
            ,Container(color: pagenumber==2?Color.fromRGBO(13,142,171, 1):Colors.transparent
              ,child: ListTile(onTap: (){setState(() {pagenumber=2;

              Navigator.push(context, MaterialPageRoute(builder: (context) => allmeds(),),);
              });},
                leading: Icon(Icons.list,color: Colors.black,)
                ,title: Text('All Medicines',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
              ),
            ),
            Divider(color: Color.fromRGBO(13,142,171, 1) )
            , ListTile(
              leading: Icon(Icons.public,color: Colors.black,)
              ,title: Text('About Us',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
            ),
            Container(color: pagenumber==6?Color.fromRGBO(13,142,171, 1):Colors.transparent,
              child: ListTile(
                onTap: (){
                  pagenumber=6;
                  print('pressed');
                  print('befor send request');
                  logout();
                },
                leading: Icon(Icons.exit_to_app_outlined,color: Colors.black,)
                ,title: Text('Sign Out',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black,

              ),),
              ),
            ), ],
        )
    );
  }
}
