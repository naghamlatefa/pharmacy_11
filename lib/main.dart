import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cron/cron.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:pharmacy_1/login.dart';
import 'local/local_controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'local/local.dart';
import 'package:provider/provider.dart';
String Token='';
String url='http://192.168.43.169:8000';
int pagenumber=1;
int issup=2;
void main() {
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
  cron.schedule(Schedule.parse('* * * * */2'), () async => {
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

  runApp(MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    Get.put(mylocalcontroller());
    return ChangeNotifierProvider(create: (context){
      return cart();
    },
    child: GetMaterialApp(
        debugShowCheckedModeBanner: false ,
        home:  login(),
      locale: Get.deviceLocale,
      translations : Mylocal(),
    ),
    );

  }

}
