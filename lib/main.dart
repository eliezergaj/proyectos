import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
void main() {
  runApp(const AcompanaTech());
}

class AcompanaTech extends StatelessWidget {
  const AcompanaTech({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AcompañaTech',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFFFF3B0), //amarillo pastel
        primaryColor: Color(0xFF1D3557), //azul oscuro
        fontFamily: 'Roboto',
      ),
      home: const LoginScreen(),
    );
  }
}