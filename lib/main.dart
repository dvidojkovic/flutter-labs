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

  NotificationSettings settings = await FirebaseMessaging.instance.requestPermission(
    alert: true,
    badge: true,
    sound: true,
  );

  print("Permission: ${settings.authorizationStatus}");

  String? token = await FirebaseMessaging.instance.getToken(
    vapidKey: "BAQjTDWpgBDswGD6P-iKzxTUaU2TgaeYQaOHnfsUymDDwbu4AmPETeQuomuGF74WXHsjFl0HJoVf3RM5SZ7Fm8M",
  );

  print("WEB FCM TOKEN: $token");

  FirebaseMessaging.onMessage.listen((msg) {
    print("Notification from Firebase Cloud Messaging: ${msg.notification?.title}");
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