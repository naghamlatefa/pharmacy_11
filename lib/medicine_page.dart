import 'package:flutter/material.dart';
import 'cart_shopping.dart';
import 'medicine.dart';
import 'package:provider/provider.dart';
import 'cart.dart';


class medicine_page extends StatelessWidget {
  const medicine_page({Key? key , required this.item}) : super(key: key);
  final medicine item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
    title:  Text(this.item.name,
    style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)
    ),
    backgroundColor: Color.fromRGBO(13,142,171, 1),
    ),
    body:  Center(
    child :Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
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
        ),
        Container(
        padding: EdgeInsets.all(1),
    child: Column(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
    SizedBox(
    height: 10,
    ),
    SizedBox(
    height: 30,
    ),
    Text(this.item.combination,
    style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Color.fromRGBO(13,142,171, 1),)),
    SizedBox(
    height: 30,
    ),
    Text(" Price : " + this.item.price.toString(),
    style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Color.fromRGBO(13,142,171, 1),)),
    SizedBox(
    height: 30,
    ),
    Text(" amount : " + this.item.amount.toString(),
    style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color:Color.fromRGBO(13,142,171, 1),)
    ),
    SizedBox(
    height: 30,
    ),
    Container(
    margin: EdgeInsets.symmetric(horizontal: 60),
    decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(20),
    color: Color.fromRGBO(13,142,171, 1),
    ),
    child: Consumer<cart>(
        builder: (context,cart,child) {
          return MaterialButton(
            height: 50,
            onPressed: () {
              cart.add(item);
              Navigator.push(context, MaterialPageRoute(builder: (context) => cart_shopping(),),);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart,
                  color: Colors.white,),
                Text(' Add To Cart',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 19,
                  ),),

              ],
            ),
          );
        }
        ),
    )]
    ),),
    ]
    ),
    ),
    );
  }
}
