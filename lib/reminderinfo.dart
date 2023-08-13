import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharmacy_1/drawer.dart';
import 'package:pharmacy_1/global_bloc.dart';
import 'package:pharmacy_1/medreminder.dart';
import 'package:provider/provider.dart';

import 'Model/medicine.dart';
import 'addareminder.dart';

class reminderinfo extends StatefulWidget {
  const reminderinfo(this.medicine, {Key? key}) : super(key: key);
  final Medicine medicine;

  @override
  State<reminderinfo> createState() => _reminderinfoState();
}

class _reminderinfoState extends State<reminderinfo> {
  Future openDialoguedelete(BuildContext context, GlobalBloc _globalBloc) =>
      showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text("Are you sure you want to delete this reminder?"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("No")),
              TextButton(
                  onPressed: () {
                    _globalBloc.removeMedicine(widget.medicine);
                    Navigator.of(context).pop();
                  },
                  child: Text("Yes"))
            ],
          ));
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final GlobalBloc _globalBloc = Provider.of<GlobalBloc>(context);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color.fromRGBO(13, 142, 171, 1),
        title: Text(
          'My Reminders'.tr,
          style: TextStyle(fontFamily: 'Kalam', fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenheight / 100),
        child: ListView(
          children: [
            Center(
              child: Icon(
                Icons.alarm,
                color: Color.fromRGBO(13, 142, 171, 1),
                size: screenheight / 5,
              ),
            ),
            Row(
              children: [
                Text("Medicine Name: ",style: TextStyle(
                    color: Color.fromRGBO(13, 142, 171, 1),
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold)),
                Container(padding: EdgeInsets.all(8.0),decoration: BoxDecoration(color:Color.fromRGBO(13, 142, 171, 1),borderRadius: BorderRadius.circular(30) ),
                  child: Text(widget.medicine.medicineName==null?'':widget.medicine.medicineName! ,style: TextStyle(
                      color: Colors.white,
                      fontSize: screenheight / 48,
                      fontFamily: 'Kalam',
                      )),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Medicine time: ",style: TextStyle(
                    color: Color.fromRGBO(13, 142, 171, 1),
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold)),
                Container(padding: EdgeInsets.all(8.0),decoration: BoxDecoration(color:Color.fromRGBO(13, 142, 171, 1),borderRadius: BorderRadius.circular(30) ),
                  child: Text('${widget.medicine!.startTime![0]}${widget.medicine!.startTime![1]}:${widget.medicine!.startTime![2]}${widget.medicine!.startTime![3]}' ,style: TextStyle(
                    color: Colors.white,
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                  )),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              children: [
                Text("Repeating time is every ",style: TextStyle(
                    color: Color.fromRGBO(13, 142, 171, 1),
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold)),
                Container(padding: EdgeInsets.all(8.0),decoration: BoxDecoration(color:Color.fromRGBO(13, 142, 171, 1),borderRadius: BorderRadius.circular(30) ),
                  child: Text(widget.medicine.hour!.toString() ,style: TextStyle(
                    color: Colors.white,
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                  )),
                ),
                Text(" hours",style: TextStyle(
                    color: Color.fromRGBO(13, 142, 171, 1),
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(height: 20,),
            Container(decoration: BoxDecoration(color: Colors.redAccent,borderRadius: BorderRadius.circular(30)),
              child: MaterialButton(
                height: 50,
                onPressed: () {
                  openDialoguedelete(context, _globalBloc);

                  }
                ,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.delete,
                      color: Colors.white,),
                    Text(' Delete'.tr,
                        style:   TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 19,fontFamily:'Kalam',
                        )
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


