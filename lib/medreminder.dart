import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:pharmacy_1/drawer.dart';

class medreminder extends StatefulWidget {
  const medreminder({Key? key}) : super(key: key);

  @override
  State<medreminder> createState() => _medreminderState();
}

class _medreminderState extends State<medreminder> {

  
  TimeOfDay _timeOfDay=TimeOfDay(hour: 8, minute: 45);
  void _showTimePicker(){
    showTimePicker(context: context,
        initialTime: TimeOfDay.now(),

    ).then((value){
      setState(() {
        _timeOfDay = value!;

      });
    });
  }
  @override
  void main(){
    WidgetsFlutterBinding.ensureInitialized();
    AwesomeNotifications().initialize(
        null,
        [
          NotificationChannel(
            channelKey: 'key1',
            channelName: 'Proto Coders Point',
            channelDescription: 'Notification example',
            defaultColor: Color.fromRGBO(13,142,171, 1),
            ledColor: Colors.white,
            playSound: true,
            enableVibration: true,
          )
        ]
    );
    final cron = Cron();
    cron.schedule(Schedule.parse('* * * * *'), () async => {
      print('every two minute'),
      await AwesomeNotifications().createNotification(
          content:NotificationContent(
            id: 1,
            channelKey: 'key1',
            title: "Water",
            body: "Do not Forget to drink water .... It is for your health",
          )
      )
    });
  }
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
          Column(children: [Text('What Times do you take your medicine?',
            style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: screenwidth/20),),
            SizedBox(
              height: 30,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(_timeOfDay.format(context).toString(),
                  style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Color.fromRGBO(13,142,171, 1),fontSize: 40),),
                MaterialButton(onPressed:_showTimePicker,
                child: Text("PICK TIME",
                  style: TextStyle(fontFamily: 'Kalam',fontWeight: FontWeight.w700,color: Colors.white,

                ),),
                  color: Color.fromRGBO(13,142,171, 1),
          ),
              ],
            )
        ],),
      ]),
      ),);
  }
}
