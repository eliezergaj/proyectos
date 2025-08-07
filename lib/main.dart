// lib/main.dart
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart'; // Importación importante
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/login_screen.dart'; // Asumiendo que esta es tu pantalla de login
import 'screens/launcher_screen.dart'; // Asumiendo que esta es tu pantalla de launcher

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('es_CL', null);
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