import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:pharmacy_1/medreminder.dart';
import 'package:pharmacy_1/reminderspage.dart';

import 'main.dart';

class reminders extends StatefulWidget {
  const reminders({Key? key}) : super(key: key);

  @override
  State<reminders> createState() => _remindersState();
}

class _remindersState extends State<reminders> {


  @override

  Widget build(BuildContext context) {
    double screenheight= MediaQuery.of(context).size.height;
    double screenwidth= MediaQuery.of(context).size.width;
    return  Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13,142,171, 1),
    title: Text('Reminders'.tr,style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
    centerTitle: true,
    ),
      body: Container(padding:EdgeInsets.all(screenwidth/26),
      child: Center(child: ListView(children: [Text('We will Remind you about water and medicine '.tr,style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/20),),
      SizedBox(height: screenheight/6,)
        ,Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Column(
          children: [
            Column(
              children: [
                GestureDetector(onTap: (){if(water==true){setState(() {
                  water=false;
                });}else if(water==false){setState(() {
                  water=true;
                });}},child:Stack (children :[Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(360),color: water==true?Colors.green:Colors.transparent),height: screenwidth/2.299,width: screenwidth/2.299),Container(margin: EdgeInsets.all(3.8),height: screenwidth/2.35,width: screenwidth/2.35,decoration: BoxDecoration(image:DecorationImage(fit:BoxFit.fill,image: AssetImage('assets/water.jpg')) ,borderRadius: BorderRadius.circular(360),color:Color.fromRGBO(13,142,171, 1) ),)]),),
             Text('Water'.tr,style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/26.6),) ],
            ),
          ],
        ),Column(
          children: [
            GestureDetector(onTap: (){Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => reminderspage()));},child: Container(height: screenwidth/2.35,width: screenwidth/2.35,decoration: BoxDecoration(image:DecorationImage(fit:BoxFit.fill,image: AssetImage('assets/medicine.jpg')),borderRadius: BorderRadius.circular(360),color:Color.fromRGBO(13,142,171, 1) ),)),
            Text('Medicine'.tr,style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/26.6),)],
        )],)],)),),
    );
  }
}
