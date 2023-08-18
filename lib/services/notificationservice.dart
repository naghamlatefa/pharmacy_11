import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService{
  final FlutterLocalNotificationsPlugin notificationsPlugin= FlutterLocalNotificationsPlugin();

Future <void> initNotification()async{
  AndroidInitializationSettings initializationSettingsAndroid = const AndroidInitializationSettings('@mipmap/ic_launcher');

  var initializationSettings= InitializationSettings(android:initializationSettingsAndroid );
  await notificationsPlugin.initialize(initializationSettings);
}
notificationDetails(){
  return const NotificationDetails(
    android: AndroidNotificationDetails('channelId', 'channelName',importance: Importance.max)
  );
}
Future showNotification({int id=0,String? title,String? body,String? payLoad})async{
return notificationsPlugin.show(id, title, body, await notificationDetails());
}

}