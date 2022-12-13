import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class Notifications {
  static Future initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    const androidInitialize =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const iOSInitialize = DarwinInitializationSettings();
    var initializationsSetting = const InitializationSettings(
        android: androidInitialize, iOS: iOSInitialize);
    await flutterLocalNotificationsPlugin.initialize(initializationsSetting);
  }
}
