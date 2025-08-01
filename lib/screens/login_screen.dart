import 'package:flutter/material.dart';
import 'launcher_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Buenvenido a AcompañaTech',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
              SizedBox(height: 40),
              ElevatedButton(onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => const LauncherScreen()));
              },
                child: Text('Entrar como Usuario'),
              ),
            ]
        ),
      ),
    );
  }
}
