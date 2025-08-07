import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'launcher_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _controller = TextEditingController();

  void _guardarNombreYContinuar(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    final nombre = _controller.text.trim();

    if (nombre.isNotEmpty) {
      await prefs.setString('userName', nombre);

      // Verifica si el widget todavía está montado antes de usar el context
      if (!mounted) return; // Si no está montado, no hagas nada más

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LauncherScreen()),
      );
    }
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
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Tu nombre',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => _guardarNombreYContinuar(context),
                child: const Text('Entrar'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {}, // aquí puedes agregar navegación a modo tutor
                child: const Text('Soy tutor'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}