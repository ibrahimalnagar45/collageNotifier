import 'dart:developer';

import 'package:notifyme/constants.dart';
import 'package:notifyme/features/home/data/models/event_model.dart';
import 'package:rxdart/rxdart.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class LocalNotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final BehaviorSubject<String?> onNotificationAction = BehaviorSubject();

  LocalNotificationService();

  Future<void> initialize() async {
    tz.initializeTimeZones();

    const AndroidInitializationSettings androidInitialize =
        AndroidInitializationSettings("@mipmap/ic_launcher");

    /// iOS: Request notification permissions
    final DarwinInitializationSettings iosInitlizeSettings =
        DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
      onDidReceiveLocalNotification: onDidReceiveLocalNotification,
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: androidInitialize,
      iOS: iosInitlizeSettings,
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  Future<NotificationDetails> notificationDetails() async {
    const androidNotificationDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        channelDescription: 'description',
        importance: Importance.max,
        priority: Priority.max,
        playSound: true);
    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails();
    return const NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
  }

  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
  }) async {
    final details = await notificationDetails();

    await flutterLocalNotificationsPlugin.show(id, title, body, details);
  }

  Future<void> showSceduledNotification({
    int id = 0,
    required String title,
    required String body,
    required Event event,
  }) async {
    final details = await notificationDetails();
    int duration = (tz.TZDateTime.now(tz.local).hour - event.dateTime.hour);
    if (duration < 0) {
      duration *= -1;
    }
    // final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    // tz.setLocalLocation(tz.getLocation(currentTimeZone));
    // log(tz.local.name);
    // log(tz.TZDateTime.now(tz.local).toString());
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id,
      title,
      body,
      // tz.TZDateTime(
      //   tz.local,
      //   dateTime.year,
      //   dateTime.month,
      //   dateTime.day,
      //   dateTime.hour,
      //   dateTime.minute,
      //   dateTime.millisecond,
      //   dateTime.microsecond,
      // ),
      tz.TZDateTime.from(
        DateTime.now().add(
          Duration(seconds: (id + 1) * 2),
        ),
        tz.local,
      ),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future<void> showNotificationWithPayload({
    required int id,
    required String title,
    required String body,
    required String payload,
  }) async {
    final details = await notificationDetails();

    await flutterLocalNotificationsPlugin.show(id, title, body, details,
        payload: payload);
  }

  void onDidReceiveLocalNotification(
      int id, String? title, String? body, String? payload) {
    print('id = $id');
  }
}


// import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// class LocalNotificationService {
//   static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//       FlutterLocalNotificationsPlugin();
//     Future<void> initialize() async {
//     var androidInitialize =
//         const AndroidInitializationSettings("@mipmap/ic_launcher");

// /// iOS: Request notification permissions
//     DarwinInitializationSettings initializationSettingsIOS =
//         const DarwinInitializationSettings(
//       requestAlertPermission: true,
//       requestBadgePermission: true,
//       requestSoundPermission: true,
//     );

//     InitializationSettings initializationSettings = InitializationSettings(
//       android: androidInitialize,
//       iOS: initializationSettingsIOS,
//     );
//     await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//   }

//     Future showTextNotification({
//     int id = 0,
//     required String title,
//     required String body,
//     bool playSound = true,
//     bool enableVibration = true,
//     var payload,
//   }) async {

//     AndroidNotificationDetails androidNotificationDetails =
//         const AndroidNotificationDetails(
//       "default_value",
//       "channel_id_5",
//       playSound: true,
//       importance: Importance.max,
//       priority: Priority.max,
//       showWhen: true,
//       showProgress: true,
//       enableVibration: true,
//     );

//     DarwinNotificationDetails darwinInitializationDetails =
//         const DarwinNotificationDetails(presentSound: true, presentAlert: true);

//     var not = NotificationDetails(
//       android: androidNotificationDetails,
//       iOS: darwinInitializationDetails,
//     );
//     await flutterLocalNotificationsPlugin.show(id, title, body, not);
//   }
// }