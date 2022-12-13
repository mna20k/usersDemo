import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:usersdetails/widgets/widgets.dart';

import '../cubit/users_cubit.dart';
import '../main.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  @override
  void initState(){
    init();
    setMessagingListeners();
    super.initState();
  }

  init() async {
    String deviceToken = await getDeviceToken();
    print('Device Token for push notification: $deviceToken');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Users Bloc Demo'),
        actions: [
          IconButton(onPressed: () { feedbackDialog(context); }, icon: const Icon(Icons.person),)
        ],
      ),
      body: BlocBuilder<UsersCubit, UsersState>(
        builder: (context, state) {
          if (state is LoadedState) {
            return ListWidget(users: state.users);
          } else if (state is ErrorState) {
            return MyErrorWidget(message: state.message);
          } else {
            return const LoadingWidget();
          }
        },
      ),
    );
  }

  Future getDeviceToken() async {
    FirebaseMessaging firebaseMessage = FirebaseMessaging.instance;
    NotificationSettings settings = await firebaseMessage.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    String? deviceToken = await firebaseMessage.getToken();
    return deviceToken ?? deviceToken;
  }

  void setMessagingListeners() async {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) async {
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(
        message.notification!.body.toString(),
        htmlFormatBigText: true,
        contentTitle: message.notification!.title.toString(),
        htmlFormatContentTitle: true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics =
      AndroidNotificationDetails(
        'users', 'users', importance: Importance.high,
        styleInformation: bigTextStyleInformation, priority: Priority.high,
        playSound: true,
        // sound: I RawResourceAndroidNotificationSound('notification'),
      );
      NotificationDetails platformChannelSpecifics = NotificationDetails(
          android: androidPlatformChannelSpecifics,
          iOS: const DarwinNotificationDetails());
      await flutterLocalNotificationsPlugin.show(0, message.notification?.title,
          message.notification?.body, platformChannelSpecifics);
    });
  }
}

