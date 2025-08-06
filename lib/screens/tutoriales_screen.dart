import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class TutorialesScreen extends StatelessWidget {
  const TutorialesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List tutoriales = [
      TutorialItem(label: 'WhatsApp', icon: Icons.chat),
      TutorialItem(label: 'Correo Electrónico', icon: Icons.email),
      TutorialItem(label: 'Instagram', icon: Icons.image),
      TutorialItem(label: 'TikTok', icon: Icons.video_library),
      TutorialItem(label: 'Navegación Segura', icon: Icons.lock),
    ];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1D3557),
        title: const Text('Tutoriales'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Cómo usar el celular',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: tutoriales.length,
                itemBuilder: (context, index) {
                  final item = tutoriales[index];
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    color: const Color(0xFFA8DADC),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: ListTile(
                      leading: Icon(item.icon, size: 40, color: Colors.white),
                      title: Text(
                        item.label,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.play_circle_fill, color: Colors.white, size: 36),
                        onPressed: () {
                          // En el futuro: reproducir audio/tutorial correspondiente
                        },
                      ),
                      onTap: () {
                        // En el futuro: mostrar pantalla con tutorial detallado
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TutorialItem {
  final String label;
  final IconData icon;

  TutorialItem({required this.label, required this.icon});
}