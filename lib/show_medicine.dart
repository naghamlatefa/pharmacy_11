import 'package:flutter/material.dart';
import 'drawer.dart';
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
      drawer: drawer(),
      appBar: AppBar(
        title: Text(" Medicines ",
        style: TextStyle(
          color: Colors.white,
            fontFamily:'Kalam'
        ),),
        backgroundColor: Color.fromRGBO(13,142,171, 1),
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
