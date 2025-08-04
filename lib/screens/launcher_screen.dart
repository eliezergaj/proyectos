import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'tutoriales_screen.dart';

class LauncherScreen extends StatefulWidget {
  const LauncherScreen({super.key});

  @override
  State createState() => _LauncherScreenState();
}

class _LauncherScreenState extends State {
  String userName = "";

  @override
  void initState() {
    super.initState();
    _loadUserName();
  }

  void _loadUserName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      userName = prefs.getString('userName') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    String currentTime = DateFormat('HH:mm').format(DateTime.now());
    String currentDate = DateFormat('EEEE d MMMM', 'es_CL').format(DateTime.now());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D3557),
        title: const Text("AcompañaTech"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bienvenido, $userName",
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "$currentDate · $currentTime",
              style: const TextStyle(fontSize: 16, color: Colors.black54),
            ),
            const SizedBox(height: 24),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _MenuButton(label: "Teléfono", icon: Icons.phone, onTap: () {}),
                  _MenuButton(label: "WhatsApp", icon: Icons.chat, onTap: () {}),
                  _MenuButton(label: "Cámara", icon: Icons.camera_alt, onTap: () {}),
                  _MenuButton(label: "Galería", icon: Icons.photo_library, onTap: () {}),
                  _MenuButton(label: "Facebook", icon: Icons.facebook, onTap: () {}),
                  _MenuButton(label: "TikTok", icon: Icons.video_library, onTap: () {}),
                  _MenuButton(label: "Instagram", icon: Icons.image, onTap: () {}),
                  _MenuButton(label: "Radio", icon: Icons.radio, onTap: () {}),
                  _MenuButton(label: "Llamar tutor", icon: Icons.support_agent, onTap: () {}),
                  _MenuButton(label: "Modo seguro", icon: Icons.lock, onTap: () {}),
                  _MenuButton(label: "Añadir acceso", icon: Icons.add_circle, onTap: () {}),
                  _MenuButton(
                    label: "Tutoriales",
                    icon: Icons.menu_book,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const TutorialesScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MenuButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onTap;

  const _MenuButton({
    required this.label,
    required this.icon,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFA8DADC),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.white),
              const SizedBox(height: 12),
              Text(
                label,
                style: const TextStyle(fontSize: 16, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

