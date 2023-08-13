import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:pharmacy_1/global_bloc.dart';
import 'package:pharmacy_1/medreminder.dart';
import 'package:pharmacy_1/reminderinfo.dart';
import 'package:provider/provider.dart';

import 'Model/medicine.dart';
import 'addareminder.dart';

class reminderspage extends StatefulWidget {
  const reminderspage({Key? key}) : super(key: key);

  @override
  State<reminderspage> createState() => _reminderspageState();
}

class _reminderspageState extends State<reminderspage> {
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final GlobalBloc globalBloc= Provider.of<GlobalBloc>(context);
   
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 142, 171, 1),
        title: Text(
          'My Reminders'.tr,
          style: TextStyle(fontFamily: 'Kalam', fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body:StreamBuilder(
        stream: globalBloc.medicineList$,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Container(child: Text('No data'),);
          } else if (snapshot.data!.isEmpty) {
            return Center(
              child: Text('No Reminders',
                  style: TextStyle(
                      color: Color.fromRGBO(13, 142, 171, 1),
                      fontSize: screenheight / 48,
                      fontFamily: 'Kalam',
                      fontWeight: FontWeight.bold)),
            );
          }
          else {
            return ListView.builder(itemCount: snapshot.data!.length,itemBuilder: (context, i) {

            return reminderslist(medicine: snapshot.data![i],) ;
          });}
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => addareminder(),
            ),
          );
        },
        backgroundColor: Color.fromRGBO(13, 142, 171, 1),
        label: const Text("Add a reminder"),
        icon: const Icon(
          Icons.alarm,
          color: Colors.white,
        ),
      ),
    );
  }
}
class reminderslist extends StatelessWidget {
  const reminderslist({Key? key, required this.medicine}) : super(key: key);
  final Medicine medicine;

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: (){Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => reminderinfo(medicine)));},
      child: Container(
        color: Color.fromRGBO(35, 33, 30, 0.1),
        padding: EdgeInsets.all(screenheight/100),
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [Container(margin: EdgeInsets.all(screenheight/150),width: screenwidth/4,height: screenheight/15 ,child: Icon(Icons.alarm,color:Color.fromRGBO(13, 142, 171, 1) ,size: screenheight/15,),),Container(padding: EdgeInsets.all(screenheight/100),width: screenwidth/4,height: screenheight/15 ,child: Text(medicine.medicineName==null?'':medicine.medicineName!.toString(),style: TextStyle(
                  color: Color.fromRGBO(13, 142, 171, 1),
                  fontSize: screenheight / 48,
                  fontFamily: 'Kalam',
                  fontWeight: FontWeight.bold)),),Container(padding: EdgeInsets.all(screenheight/100),width: screenwidth/4,height: screenheight/15 ,child: Text('${medicine!.startTime![0]}${medicine!.startTime![1]}:${medicine!.startTime![2]}${medicine!.startTime![3]}',style: TextStyle(
                  color: Color.fromRGBO(13, 142, 171, 1),
                  fontSize: screenheight / 48,
                  fontFamily: 'Kalam',
                  fontWeight: FontWeight.bold)),)],
            ),
            Divider(color:Color.fromRGBO(13, 142, 171, 1) ,)
          ],
        ),
      ),
    );
  }
}

