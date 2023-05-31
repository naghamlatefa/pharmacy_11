import 'package:flutter/material.dart';
import 'package:pharmacy_1/cart_shopping.dart';
import 'package:pharmacy_1/reminders.dart';
import 'package:pharmacy_1/categories.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text('Abd',style: TextStyle(fontFamily: 'Kalam',fontSize: 30),), accountEmail: Text('Pharmacy.com',style: TextStyle(fontFamily: 'Kalam',fontSize: 25)),
          decoration: BoxDecoration(color: Color.fromRGBO(13,142,171, 1)),),
          ListTile(
            leading: Icon(Icons.person,color: Color.fromRGBO(13,142,171, 1),)
            ,title: Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
          )
          ,ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => categories(),),);},
    leading: Icon(Icons.list,color: Color.fromRGBO(13,142,171, 1),)
    ,title: Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
    ), ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => cart_shopping(),),);},
            leading: Icon(Icons.shopping_cart,color: Color.fromRGBO(13,142,171, 1),)
            ,title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
          ), ListTile(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => reminders(),),);},
            leading: Icon(Icons.access_time_outlined,color: Color.fromRGBO(13,142,171, 1),)
            ,title: Text('Reminders',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
          ),Divider(color: Color.fromRGBO(13,142,171, 1) )
    , ListTile(
            leading: Icon(Icons.public,color: Color.fromRGBO(13,142,171, 1),)
            ,title: Text('About Us',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
          ),
          ListTile(
            leading: Icon(Icons.exit_to_app_outlined,color: Color.fromRGBO(13,142,171, 1),)
            ,title: Text('Sign Out',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(13,142,171, 1)),),
          ), ],
      )
    );
  }
}
