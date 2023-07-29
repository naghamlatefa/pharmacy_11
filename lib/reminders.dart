import 'package:flutter/material.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:pharmacy_1/medreminder.dart';

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
    title: Text('Reminders',style: TextStyle(fontFamily:'Kalam',fontWeight: FontWeight.w700),),
    centerTitle: true,
    ),
      body: Container(padding:EdgeInsets.all(screenwidth/26),
      child: Center(child: ListView(children: [Text('We will Remind you about water and medicine ',style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/20),),
      SizedBox(height: screenheight/6,)
        ,Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [Column(
          children: [
            Column(
              children: [
                GestureDetector(onTap: (){},child: Container(height: screenwidth/2.35,width: screenwidth/2.35,decoration: BoxDecoration(image:DecorationImage(fit:BoxFit.fill,image: AssetImage('assets/water.jpg')) ,borderRadius: BorderRadius.circular(360),color:Color.fromRGBO(13,142,171, 1) ),)),
             Text('Water',style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/26.6),) ],
            ),
          ],
        ),Column(
          children: [
            GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => medreminder(),),);},child: Container(height: screenwidth/2.35,width: screenwidth/2.35,decoration: BoxDecoration(image:DecorationImage(fit:BoxFit.fill,image: AssetImage('assets/medicine.jpg')),borderRadius: BorderRadius.circular(360),color:Color.fromRGBO(13,142,171, 1) ),)),
            Text('Medicine',style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/26.6),)],
        )],)],)),),
    );
  }
}
