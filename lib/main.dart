import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:usersdetails/api/users_api.dart';
import 'package:usersdetails/notifications/notifications.dart';
import 'package:usersdetails/screens/users_screen.dart';

import 'cubit/users_cubit.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print('handling background message: $message');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState(){
    super.initState();
    Notifications.initialize(flutterLocalNotificationsPlugin);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
      UsersCubit(usersApi: UsersApi())..getAllUsers(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Users Bloc Demo',
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home: const UsersScreen(),
      ),
    );
  }
}
