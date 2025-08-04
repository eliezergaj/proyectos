import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/launcher_screen.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const AcompanaTechApp());
}

class AcompanaTechApp extends StatelessWidget {
  const AcompanaTechApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AcompañaTech',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF3B0),
        primaryColor: Color(0xFF1D3557),
        textTheme: ThemeData.light().textTheme.apply(
          bodyColor: Colors.black,
          displayColor: Colors.black,
        ),
      ),
      home: const LoginScreen(),
    );
  }
}