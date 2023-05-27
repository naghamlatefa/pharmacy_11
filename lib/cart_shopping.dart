import 'package:flutter/material.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:provider/provider.dart';
import 'medicine.dart';
import 'cart.dart';
class cart_shopping extends StatefulWidget {
  const cart_shopping({Key? key}) : super(key: key);
  @override
  State<cart_shopping> createState() => _chechoutState();
}
class _chechoutState extends State<cart_shopping> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(90, 130, 95, 100),
          title: Text("Your Cart "),
        ),
        body: Consumer<cart>(
          builder: (context,cart,child){
            return ListView.builder(
              itemCount: cart.basketitem.length,
              itemBuilder: (context,i){
                return Container(
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
                    image: DecorationImage(
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.35),
                        BlendMode.multiply,
                      ),
                      image: AssetImage("assets/"  + "${cart.basketitem[i].image}"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${cart.basketitem[i].name}",
                                  style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                              SizedBox(height: 30),
                              Text("price : " + "${cart.basketitem[i].price}",
                                  style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                              IconButton(
                                icon: Icon(Icons.delete_forever,
                                color: Colors.white,),
                                onPressed: (){
                                  cart.remove(cart.basketitem[i]);
                                },
                              ),
                            ]
                        ),

                      ]
                  ),


                );

              },
                );
          },
        ),
      bottomNavigationBar:Container(
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Consumer<cart>(builder: (context,cart,child){
              return  Expanded(
                child: Text(" Total  Price:"+"${cart.totalprice}",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(90, 130, 95, 100)
                ),),
              );
            }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(90, 130, 95, 100),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("OK"),
                  onPressed: () {

                  },
                ),
              ),
            ),
          ],
        ),
      ),

          );
  }
}
