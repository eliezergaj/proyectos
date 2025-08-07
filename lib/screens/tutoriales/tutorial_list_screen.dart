import 'package:flutter/material.dart';
import 'tutorial_detail_screen.dart';
import 'package:acompanatech/models/tutorial_model.dart';


class TutorialListScreen extends StatelessWidget {
  final List<Tutorial> tutorials = [
    Tutorial(
      id: 'whatsapp',
      title: 'WhatsApp',
      icon: 'assets/images/whatsapp_icon.png',
      steps: _whatsappSteps,
    ),
    // Agrega más tutoriales aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Aprende a usar tus apps")),
      body: ListView.builder(
        itemCount: tutorials.length,
        itemBuilder: (ctx, index) => _TutorialCard(tutorial: tutorials[index]),
      ),
    );
  }
}

class _TutorialCard extends StatelessWidget {
  final Tutorial tutorial;

  const _TutorialCard({required this.tutorial});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(tutorial.icon, width: 40),
        title: Text(tutorial.title),
        subtitle: Text("${tutorial.totalSteps} pasos"),
        trailing: const Icon(Icons.arrow_forward),
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => TutorialDetailScreen(tutorial: tutorial),
          ),
        ),
      ),
    );
  }
}

final _whatsappSteps = [
  TutorialStep(
    stepNumber: 1,
    instruction: "Toca el ícono verde de WhatsApp para abrir la app",
    imagePath: "assets/images/whatsapp_step1.png",
    audioPath: "audios/whatsapp_step1.mp3",
  ),
  TutorialStep(
    stepNumber: 2,
    instruction: "Presiona el botón 'Nuevo chat' (ícono de mensaje con un +)",
    imagePath: "assets/images/whatsapp_step2.png",
  ),
  // Agrega más pasos...
];