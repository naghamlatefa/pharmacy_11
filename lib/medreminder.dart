import 'package:flutter/material.dart';
import 'package:pharmacy_1/drawer.dart';

class medreminder extends StatefulWidget {
  const medreminder({Key? key}) : super(key: key);

  @override
  State<medreminder> createState() => _medreminderState();
}

class _medreminderState extends State<medreminder> {
  @override
  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: drawer(),
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(13,142,171, 1),
          title: Text('Medicine Reminder',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
          centerTitle: true,
        ),
      body: Container(
        padding:EdgeInsets.all(screenwidth/26),
        child: ListView(children: [
          Column(children: [Text('What days do you take your medicine?',style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/20),)],)
        ],),
      ),
    );
  }
}
