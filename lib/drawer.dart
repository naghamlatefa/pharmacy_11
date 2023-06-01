import 'package:flutter/material.dart';
import 'package:pharmacy_1/cart_shopping.dart';
import 'package:pharmacy_1/reminders.dart';
import 'package:pharmacy_1/categories.dart';

class drawer extends StatefulWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  State<drawer> createState() => _drawerState();
}

class _drawerState extends State<drawer> {

  @override
  Widget build(BuildContext context) {
    Color selectioncolor1=Colors.transparent;
    Color selectioncolor2=Colors.transparent;
    Color selectioncolor3=Colors.transparent;
    Color selectioncolor4=Colors.transparent;
    int pagenumber=0;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text('Abd',style: TextStyle(fontFamily: 'Kalam',fontSize: 30),), accountEmail: Text('Pharmacy.com',style: TextStyle(fontFamily: 'Kalam',fontSize: 25)),
          decoration: BoxDecoration(color: Color.fromRGBO(13,142,171, 1)),),
          Container(color: pagenumber==1?Color.fromRGBO(13,142,171, 1):Colors.transparent,
            child: ListTile(onTap: (){setState(() {
             pagenumber=1;
            });},
              leading: Icon(Icons.person,color: Colors.black,)
              ,title: Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
            ),
          )
          ,Container(color: pagenumber==2?Color.fromRGBO(13,142,171, 1):Colors.transparent
            ,child: ListTile(onTap: (){setState(() {pagenumber=2;

              Navigator.push(context, MaterialPageRoute(builder: (context) => categories(),),);
            });},
    leading: Icon(Icons.list,color: Colors.black,)
    ,title: Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
    ),
          ), Container(color: pagenumber==3?Color.fromRGBO(13,142,171, 1):Colors.transparent,
            child: ListTile(onTap: (){setState(() {pagenumber=3;
              Navigator.push(context, MaterialPageRoute(builder: (context) => cart_shopping(),),);
            });},
              leading: Icon(Icons.shopping_cart,color: Colors.black,)
              ,title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
            ),
          ), Container(color: pagenumber==4?Color.fromRGBO(13,142,171, 1):Colors.transparent,
            child: ListTile(onTap: (){setState(() {
              pagenumber=4;
              Navigator.push(context, MaterialPageRoute(builder: (context) => reminders(),),);
            });},
              leading: Icon(Icons.access_time_outlined,color: Colors.black,)
              ,title: Text('Reminders',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
            ),
          ),Divider(color: Color.fromRGBO(13,142,171, 1) )
    , ListTile(
            leading: Icon(Icons.public,color: Colors.black,)
            ,title: Text('About Us',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined,color: Colors.black,)
            ,title: Text('Sign Out',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Colors.black),),
          ), ],
      )
    );
  }
}
