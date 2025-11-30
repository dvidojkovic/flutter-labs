import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_labs1/screens/details_screen.dart';
import 'package:flutter_application_labs1/screens/categories_screen.dart';
import 'package:flutter_application_labs1/screens/favorites_screen.dart';
import 'package:flutter_application_labs1/screens/meal_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_application_labs1/services/favorites_provider.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );

  final notificationSettings = await FirebaseMessaging.instance.requestPermission(alert: true, badge: true, sound: true);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    if (message.notification != null) {
      print('Notification Title: ${message.notification!.title}');
      print('Notification Body: ${message.notification!.body}');
    }
  });

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FavoritesProvider())
      ],
      child: const MyApp()
    )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Лабораториска вежба',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const CategoriesPage(title: 'Categories App'),
        '/meals': (context) => MealPage(),
        '/details': (context) => const MealDetailPage(),
        '/favorites': (context) => FavoritesPage(),
      },
    );
  }
}