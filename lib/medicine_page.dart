import 'package:flutter/material.dart';
import 'medicine_box.dart';
import 'medicine.dart';

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
        backgroundColor: Color.fromRGBO(90, 130, 95, 100),
      ),
      body:  Center(
        child: Container(
          padding: EdgeInsets.all(0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Center(
                child: Image.asset("assets/" + this.item.image),
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
                          style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Color.fromRGBO(90, 130, 95, 100),)),
                      SizedBox(
                        height: 30,
                      ),
                      Text(" Price : " + this.item.price.toString(),
                          style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color: Color.fromRGBO(90, 130, 95, 100),)),
                      SizedBox(
                        height: 30,
                      ),
                      Text(" amount : " + this.item.amount.toString(),
                          style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.bold,color:Color.fromRGBO(90, 130, 95, 100),)
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          margin: EdgeInsets.symmetric(horizontal: 60),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color.fromRGBO(90, 130, 95, 100),
                          ),
                          child: MaterialButton(
                            height: 50,
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.medical_services_sharp,
                                  color: Colors.white,),
                                Text(' Add To Box',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 19,
                                  ),),
                              ],
                            ),
                          )),

                    ],
                  ),
                ),

            ],
          ),
        ),
      ),
    );
  }
}
