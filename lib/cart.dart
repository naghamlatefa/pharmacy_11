import 'package:flutter/material.dart';
class cart extends StatelessWidget {
  final String name1;
  final int price1;
  const cart({Key? key, required this.name1, required this.price1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Cart",
          style: TextStyle(fontWeight: FontWeight.w700,
              fontFamily:'Kalam',
              color: Colors.white),
        ),
        backgroundColor:Color.fromRGBO(90, 130, 95, 100) ,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: 180,
        decoration: BoxDecoration(
          color: Color.fromRGBO(90, 130, 95, 100),
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
        ),
        child: Stack(
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text('$name1',
                        style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                    SizedBox(height: 30),
                    Text("price : " + '$price1',
                        style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),

                  ]
              ),
            ]
        ),
      ),


    );
  }
}
