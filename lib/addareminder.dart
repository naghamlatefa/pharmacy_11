import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'package:cron/cron.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import 'package:http/http.dart' as http;
import 'package:pharmacy_1/common/convert_time.dart';
import 'package:pharmacy_1/global_bloc.dart';
import 'package:pharmacy_1/reminderentrybloc/reminderbloc.dart';
import 'package:pharmacy_1/reminderspage.dart';
import 'package:pharmacy_1/services/notificationservice.dart';
import 'package:provider/provider.dart';
import 'Model/medicine.dart';
import 'main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;



class addareminder extends StatefulWidget {
  const addareminder({Key? key}) : super(key: key);

  @override
  State<addareminder> createState() => _addareminderState();
}

class _addareminderState extends State<addareminder> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  var name = TextEditingController();
  late var formkey = GlobalKey<FormState>();

  var selectedhour;
  var hour = TextEditingController();
  List hours = ["4", "6", "8", "12", "24"];
  late NewEntryBloc _newEntryBloc;

  void dispose() {
    super.dispose();
    name.dispose();
    _newEntryBloc.dispose();
  }

  @override
  void initState() {
    super.initState();

    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    var name = TextEditingController();
    var formkey = GlobalKey<FormState>();
    _newEntryBloc = NewEntryBloc();
    //initializeNotifictations();
    var _selected;
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService().initNotification();

  }

  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    final GlobalBloc globalBloc = Provider.of<GlobalBloc>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed:(){NotificationService().showNotification(title: 'hey',body: 'hey');} , icon: Icon(Icons.add))],
        backgroundColor: Color.fromRGBO(13, 142, 171, 1),
        title: Text(
          'New Reminder',
          style: TextStyle(fontFamily: 'Kalam', fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
      ),
      body: Provider<NewEntryBloc>.value(
        value: _newEntryBloc,
        child: Form(
          key: formkey,
          child: Container(
              padding: EdgeInsets.all(screenheight / 60),
              child: ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: TextFormField(
                      controller: name,
                      cursorColor: Color.fromRGBO(13, 142, 171, 1),
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          fillColor: Color.fromRGBO(201, 201, 201, 100),
                          filled: true,
                          prefixIcon: Icon(
                            Icons.abc,
                            color: Color.fromRGBO(13, 142, 171, 1),
                          ),
                          hintText: 'Name'.tr,
                          hintStyle: TextStyle(fontFamily: 'Kalam')),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter the name of the medicine'.tr;
                        }
                        return null;
                      },
                    ),
                  ),

                  selecthour(),
                  selecttime(),
                  SizedBox(
                    height: screenheight / 60,
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 60),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(13, 142, 171, 1),
                      ),
                      child: MaterialButton(
                        height: 50,
                        onPressed: () {
                          if (name.text == "" ||
                              _newEntryBloc.selectedTimeOfDay$!.value ==
                                  "Instance of 'Future<TimeOfDay?>'" ) {
                            openDialogueempty(context);
                          } else {

                            String? medicineName;

                            medicineName = name.text;

                            int hour = _newEntryBloc.selecthour!.value;
                            String startTime =
                                _newEntryBloc.selectedTimeOfDay$!.value;
                            List<int> intIDs =
                                makeIDs(24 / _newEntryBloc.selecthour!.value);
                            List<String> notificationIDs =
                                intIDs.map((i) => i.toString()).toList();

                            Medicine newEntryMedicine = Medicine(
                                notificationIDs: notificationIDs,
                                medicineName: medicineName,
                                hour: hour,
                                startTime: startTime);

                            setState(() {
                              globalBloc.updateMedicineList(newEntryMedicine);
                              scheduleNotification(newEntryMedicine);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => reminderspage()));
                            });
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                            Text(
                              ' Add Reminder'.tr,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 19,
                              ),
                            ),
                          ],
                        ),
                      )),
                ],
              )),
        ),
      ),
    );
  }

  List<int> makeIDs(double n) {
    var rng = Random();
    List<int> ids = [];
    for (int i = 0; i < n; i++) {
      ids.add(rng.nextInt(1000000000));
    }
    return ids;
  }

  /*Future <void >initializeNotifictations() async {
    var initilizationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initilizationSettingsAndroid);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }*/

  Future onSelectNotification(String? payload) async {
    if (payload != null) {
      debugPrint('notification payload: $payload');
    }
    await Navigator.push(context,
        MaterialPageRoute(builder: (context) => const reminderspage()));
  }

  Future<void> scheduleNotification(Medicine medicine) async {
    var hour = int.parse(medicine.startTime![0] + medicine.startTime![1]);
    var ogValue = hour;
    var minute = int.parse(medicine.startTime![2] + medicine.startTime![3]);
    var cron=new Cron();
    var androidPlatformChannelSpecifics =  await AndroidNotificationDetails(
        'repeatDailyAtTime channel id', 'repeatDailyAtTime channel name',
        importance: Importance.max,
        priority: Priority.max,
        ledColor: Colors.blue,
        ledOffMs: 1000,
        ledOnMs: 1000,
        enableLights: true);



    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
      );

    for (int i = 0; i < (24 / medicine.hour!).floor(); i++) {

     cron.schedule(new Schedule.parse('$minute $hour * * *'),() async{
       await flutterLocalNotificationsPlugin.show(
           int.parse(medicine.notificationIDs![i]),
           'Reminder: ${medicine.medicineName}',
           'It is time to take your medicine ${medicine.medicineName}',
           //Time(hour,minute, 3),
           platformChannelSpecifics);
       hour = ogValue;
     });
    }
  }
}

class selecthour extends StatefulWidget {
  const selecthour({Key? key}) : super(key: key);

  @override
  State<selecthour> createState() => _selecthourState();
}

class _selecthourState extends State<selecthour> {
  @override
  var _selected = 0;

  Widget build(BuildContext context) {
    final _hours = [4, 6, 8, 12, 24];

    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    newEntryBloc.updatehour(24);
    return SizedBox( height: screenheight / 138,)/*Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Expanded(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Repeat every',
              style: TextStyle(
                  color: Color.fromRGBO(13, 142, 171, 1),
                  fontSize: screenheight / 48,
                  fontFamily: 'Kalam',
                  fontWeight: FontWeight.bold),
            ),
            Container(
              height: screenheight / 8,
              width: screenwidth / 4,
              child: Center(
                /*child: DropdownButton(
                  isExpanded: true,
                  iconEnabledColor: Color.fromRGBO(13, 142, 171, 1),
                  dropdownColor: Colors.white,
                  hint: _selected == 0
                      ? Text('select repeating time',
                          style: TextStyle(
                              color: Color.fromRGBO(13, 142, 171, 1),
                              fontSize: screenheight / 90,
                              fontFamily: 'Kalam',
                              fontWeight: FontWeight.bold))
                      : null,
                  value: _selected == 0 ? null : _selected,
                  items: _hours.map((int value) {
                    return DropdownMenuItem<int>(
                        value: value,
                        child: Text(value.toString(),
                            style: TextStyle(
                                color: Color.fromRGBO(13, 142, 171, 1),
                                fontSize: screenheight / 48,
                                fontFamily: 'Kalam',
                                fontWeight: FontWeight.bold)));
                  }).toList(),
                  onChanged: (newVal) {
                    setState(() {
                      _selected = newVal!;
                      print("new val is $newVal");
                      newEntryBloc.updatehour(newVal!);
                    });
                  },
                ),*/
              ),
            ),
            Text("hours",
                style: TextStyle(
                    color: Color.fromRGBO(13, 142, 171, 1),
                    fontSize: screenheight / 48,
                    fontFamily: 'Kalam',
                    fontWeight: FontWeight.bold))
          ],
        ),
      ),
    )*/;
  }
}

class selecttime extends StatefulWidget {
  const selecttime({Key? key}) : super(key: key);

  @override
  State<selecttime> createState() => _selecttimeState();
}

class _selecttimeState extends State<selecttime> {
  @override
  Widget build(BuildContext context) {
    final NewEntryBloc newEntryBloc = Provider.of<NewEntryBloc>(context);
    TimeOfDay? _time = const TimeOfDay(hour: 0, minute: 00);
    Future<TimeOfDay?> _selectTime() async {
      final TimeOfDay? picked =
          await showTimePicker(context: context, initialTime: _time!);
      if (picked != null && picked != _time) {
        setState(() {
          _time = picked;
          newEntryBloc.updateTime(convertTime(_time!.hour.toString()) +
              convertTime(_time!.minute.toString()));
        });
      }
      return picked!;
    }

    return Container(
        margin: EdgeInsets.symmetric(horizontal: 60),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromRGBO(13, 142, 171, 1),
        ),
        child: MaterialButton(
          height: 50,
          onPressed: () {
            //_selectTime();
            newEntryBloc.updateTime(_selectTime().toString());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.access_time_outlined,
                color: Colors.white,
              ),
              Text(
                ' Starting Time'.tr,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 19,
                ),
              ),
            ],
          ),
        ));
  }
}

Future openDialogueempty(BuildContext context) => showDialog(
    context: context,
    builder: (BuildContext context) => AlertDialog(
          title: Text("Please fill all fields"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("ok"))
          ],
        ));
