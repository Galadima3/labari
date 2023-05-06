import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:labari/src/features/news/presentation/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
    if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        tabBarTheme: const TabBarTheme(
          labelColor: Colors.black,
          labelStyle: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}
