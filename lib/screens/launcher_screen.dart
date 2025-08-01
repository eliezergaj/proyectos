import 'package:flutter/material.dart';

class LauncherScreen extends StatelessWidget {
  const LauncherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('AcompañaTech')),
      body: GridView.count(padding: const EdgeInsets.all(16),
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          children: [
            _MenuButton(
                label: 'Tutoriales', icon: Icons.menu_book, onTap: () {}),
            _MenuButton(
                label: 'Modo Seguro', icon: Icons.security, onTap: () {}),
            _MenuButton(
                label: 'Llamar Tutor', icon: Icons.video_call, onTap: () {}),
            _MenuButton(
                label: 'Asistente de Voz', icon: Icons.mic, onTap: () {}),
          ]
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuButton(
      {required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFA8DADC),
          borderRadius:
          BorderRadius.circular(16),
        ),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              SizedBox(height: 12),
              Text(label, style: TextStyle(fontSize: 18, color: Colors.white)),
            ]
        ),
      ),
    );
  }
}
