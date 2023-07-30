import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:cron/cron.dart';
import 'package:pharmacy_1/cart.dart';
import 'package:pharmacy_1/login.dart';
import 'package:pharmacy_1/providerstorage.dart';
import 'categories.dart';
import 'local/local_controller.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'local/local.dart';
import 'package:provider/provider.dart';
String Token='Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYjBmODE5NGZkYjc5YzZkMGVjYzFjNTZkYTRiODk1NjVmNTI0NDAzM2IzY2FlNmU3NzNiYjA3MTk3MGNjMzM3MjdjNDU4ZmRjZjhkMGRjZjMiLCJpYXQiOjE2OTA3Mjg2ODAuMjY1ODQ5LCJuYmYiOjE2OTA3Mjg2ODAuMjY1ODU0LCJleHAiOjE3MjIzNTEwODAuMjU4ODQ4LCJzdWIiOiIxMDEiLCJzY29wZXMiOlsidXNlciJdfQ.RxY2c9X3qyCEzCwQnZiYWSf6aCiZgcql8t1bRP0_TncqlweWyx395ugxKKc3IDHurnjTodTz7zGJrLiJSH_RhalFeIQ8wwrS81KxoTlH_XsZoEkjcEfi9mgrkM-lTX5ftUc2BqCgWaqBPwi5hgDSuYgg1GWV7m6_TBe2_POZk8JTROYqKeHgaRZHxaZoWeVDavenUcDtzMoqQ6FigYPaqdNCAYHmpS_9fDix_5Wq4R8O27xqU6jDE2W1dB3uRLXnppRF6cyYpuh1jc9Oz61LcLXrtaUS62LL5O8_OxH6li6m_t9KVdWGuPW6fLX8kFwo9wMXLlQOG-2zX-4KbztsvjTJduA5fUqRGfahMXDX5ruW3Qi7D254u4_xYXCZ6vIcYs_Jd_7dDJetF0xGMrcN76c74eGND_gA0ZMs1nA_CfKp-g1Hxmlk3drQuSkwZjKS3eSmN1VbrDpuxEbA8A4kHuyCCgj4AqtVIa2D0kE313cDMVSoo8b7rvuZRxn4KvINwWIzzFzUcWo6Upa-qknV59WT56V8ThH3xwIS2yORql5K5HlF-655gvoc44ZbH0b3CbvOVR2frSzQ4ayI2h2O240dIqUijZb2Usuq2VJNdJHIX2TSRRKd_c-ld8SObr0lZL4y0BBSE6cTHYbP4SvTDtRXLpMTJidh7UpbI62zsuo';
String url='http://192.168.1.108:8000';
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
        home:  categories(),
      locale: Get.deviceLocale,
      translations : Mylocal(),
    ),
    );

  }

}
