import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseNotificationsService {
  void handleForegroundNotification() {
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings androidInitializationSettings =
        AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings darwinInitializationSettings =
        DarwinInitializationSettings();
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: androidInitializationSettings,
            iOS: darwinInitializationSettings);

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
        'messages', 'messages',
        description: 'This is for flutter firebase',
        importance: Importance.max);

    createChannel(channel);
    flutterLocalNotificationsPlugin.initialize(initializationSettings);

    FirebaseMessaging.onMessage.listen(
      (event) {
        final notification = event.notification;
        final android = event.notification?.android;
        if (notification != null && android != null) {
          flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(channel.id, channel.name,
                  channelDescription: channel.description,
                  icon: android.smallIcon),
            ),
          );
        }
      },
    );
  }

  void createChannel(AndroidNotificationChannel channel) async {
    final FlutterLocalNotificationsPlugin plugin =
        FlutterLocalNotificationsPlugin();
    await plugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
}
