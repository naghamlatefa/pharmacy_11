import 'package:flutter/material.dart';
import 'medicine.dart';
import 'medicine_box.dart';

import 'medicine_page.dart';
class show_medicine extends StatelessWidget {
   show_medicine({Key? key }) : super(key: key);
  final items = medicine.getmedicines();
   Icon cusIcon = Icon(Icons.search);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Medicines ",
        style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Color.fromRGBO(90, 130, 95, 100),
        actions: [IconButton(icon: cusIcon,
            onPressed: (){
            } )],
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context,index){
          return GestureDetector(
            child: medicine_box( item: items[index],),
            onTap: (){
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => medicine_page(item :items[index])));
            },
          );


        }
        ),


      );

  }
}
