import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'main.dart';
import 'cart.dart';
import 'medinfo.dart';

class cart_shopping extends StatefulWidget {
  const cart_shopping({Key? key}) : super(key: key);
  @override
  State<cart_shopping> createState() => _chechoutState();
}
class _chechoutState extends State<cart_shopping> {
  Future cart(String id,String amount)async{
    var response = await http.post(
        Uri.parse('$url/api/user/medicine/buy'),
        body: <String,String>
        {
          'medicine_ids[0]':id,
          'quantity[0]': amount.toString()
        },
        headers: {"Accept":"application/json",
          'Accept': 'application/json',
          'Authorization': 'Bearer $Token'

        }
    );
    var responsebody=jsonDecode(response.body);
    print(responsebody['status']);
    //Token=js['token'];

    print("response is ${response.body}");
    print("response is ${response.statusCode}");
    if(response.statusCode==200){
      print("response is ${response.body}");
      openDialogue2(context);
      final cartInstance = Provider.of<Cart>(context, listen: false);
      for (var item in cartInstance.basketitem) {
        cartInstance.remove(item);
      }

    }

    else{
      print("sorry");
    }
  }
  var amount=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(13,142,171, 1),
          title: Text("Your Cart".tr,
          style: TextStyle(
              fontFamily:'Kalam'
          ),),
        ),
        body: Consumer<Cart>(
          builder: (context,Cart,child){
            return ListView.builder(
              itemCount: Cart.basketitem.length,
              itemBuilder: (context,i){
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 22, vertical: 10),
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: 180,
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(13,142,171, 100),
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
                      image: AssetImage("assets/login.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Stack(
                      children: [
                        Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(Cart.basketitem[i].name,
                                  style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                              SizedBox(height: 30),
                              Text("  price : " + "${Cart.basketitem[i].price}",
                                  style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                              SizedBox(height: 30),
                              Text("  Amount : " + "${Cart.basketitem[i].amount}",
                                  style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Colors.white,)),
                             IconButton(
                                icon: Icon(Icons.delete_forever,
                                color: Colors.white,),
                                onPressed: (){
                                  Cart.remove(Cart.basketitem[i]);
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
            Consumer<Cart>(builder: (context,cart,child){
              return  Expanded(
                child: Text(" Total  Price:".tr+"${cart.totalprice}",
                style: TextStyle(
                  fontSize: 30,
                  color: Color.fromRGBO(13,142,171, 1),
                    fontFamily:'Kalam'
                ),),
              );
            }),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(13,142,171, 1),
                    textStyle: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: Text("OK".tr
                  ,style: TextStyle(
                        fontFamily:'Kalam'
                    ),),
                  onPressed: () {
                    print('preeeeeeeeeeesd');

                      final cartInstance = Provider.of<Cart>(context, listen: false);
                      for (var item in cartInstance.basketitem) {
                        cart(item.id, item.amount.toString());
                      }

                  },
                ),
              ),
            ),
          ],
        ),
      ),

          );
  }
  Future openDialogue2(BuildContext context) =>
      showDialog(context: context, builder: (BuildContext context) =>
          AlertDialog(title: Text(
            'We took Your order wait to receive it',
            style: TextStyle(
              color:Color.fromRGBO(13,142,171, 1) ,
                fontFamily:'Kalam'
            ),
          )

          )
      );
}
