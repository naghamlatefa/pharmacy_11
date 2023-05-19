import 'package:flutter/material.dart';
import 'medicine.dart';

class medicine_box extends StatelessWidget {
  const medicine_box({Key ? key , required this.item}) : super(key: key);
final medicine item;
  @override
  Widget build(BuildContext context) {
    return Container(

      padding: EdgeInsets.all(2),
      height: 150,
      width: 50,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("assets/"  + this.item.image,width: 120,),
            Expanded(child: Container(
              padding: EdgeInsets.all(5),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(this.item.name,
                    style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(this.item.combination),
                    Text("price : " + this.item.price.toString()),
                    Text("amoumt : " + this.item.amount.toString()),

                  ],
                ),
              ),
            )

            )
          ],
        ),
      ),
    );
  }
}

