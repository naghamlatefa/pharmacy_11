import 'package:flutter/material.dart';

class drawer extends StatelessWidget {
  const drawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(accountName: Text('Abd',style: TextStyle(fontFamily: 'Kalam',fontSize: 30),), accountEmail: Text('Pharmacy.com',style: TextStyle(fontFamily: 'Kalam',fontSize: 25)),
          decoration: BoxDecoration(color: Color.fromRGBO(90, 130, 95, 100)),),
          ListTile(
            leading: Icon(Icons.person,color: Color.fromRGBO(90, 130, 95, 100),)
            ,title: Text('Profile',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(90, 130, 95, 100)),),
          )
          ,ListTile(
    leading: Icon(Icons.list,color: Color.fromRGBO(90, 130, 95, 100),)
    ,title: Text('Categories',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(90, 130, 95, 100)),),
    ), ListTile(
            leading: Icon(Icons.shopping_cart,color: Color.fromRGBO(90, 130, 95, 100),)
            ,title: Text('My Cart',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(90, 130, 95, 100)),),
          ), ListTile(
            leading: Icon(Icons.access_time_outlined,color: Color.fromRGBO(90, 130, 95, 100),)
            ,title: Text('Reminders',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(90, 130, 95, 100)),),
          ),Divider(color: Color.fromRGBO(90, 130, 95, 100) )
    , ListTile(
            leading: Icon(Icons.public,color: Color.fromRGBO(90, 130, 95, 100),)
            ,title: Text('About Us',style: TextStyle(fontWeight: FontWeight.w700,fontFamily:'Kalam',color: Color.fromRGBO(90, 130, 95, 100)),),
          ),
        ],
      )
    );
  }
}
