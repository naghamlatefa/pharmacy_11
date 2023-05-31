import 'package:flutter/material.dart';
import 'medicine.dart';

class medicine_box extends StatelessWidget {
  const medicine_box({Key ? key, required this.item}) : super(key: key);
  final medicine item;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: 180,
      decoration: BoxDecoration(
        color: Color.fromRGBO(13,142,171, 1),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.6),
            offset: Offset(
              0.0,
              10.0,
            ),
            blurRadius: 10.0,
            spreadRadius: -6.0,
          ),
        ],
        image: DecorationImage(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.35),
            BlendMode.multiply,
          ),
          image: AssetImage("assets/"  + this.item.image),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
          children: [
       Column(
      mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(this.item.name,
                style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
            SizedBox(height: 30),
            Text(this.item.combination,
              style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
            SizedBox(height: 10),
            Text("price : " + this.item.price.toString(),
              style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
            SizedBox(height: 10),
            Text("  amoumt : " + this.item.amount.toString(),
              style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
      ]
    ),
      ]
    ),
    );
  }
}
