import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'launcher_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State createState() => _LoginScreenState();
}

class _LoginScreenState extends State {
  final TextEditingController _controller = TextEditingController();

  void _saveNameAndContinue() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', _controller.text);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LauncherScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '¿Cómo quieres que te llamemos?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Tu nombre',
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveNameAndContinue,
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: const Text('Soy tutor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}