import 'package:flutter/material.dart';
import 'package:acompanatech/models/tutorial_model.dart';
import 'package:acompanatech/screens/tutoriales/tutorial_step_widget.dart';

class TutorialDetailScreen extends StatefulWidget {
  final Tutorial tutorial;

  const TutorialDetailScreen({super.key, required this.tutorial});

  @override
  State<TutorialDetailScreen> createState() => _TutorialDetailScreenState();
}

class _TutorialDetailScreenState extends State<TutorialDetailScreen>
    with SingleTickerProviderStateMixin { // Añade esto
  late AnimationController _stepAnimationController;
  int _currentStep = 0;
  bool _completed = false;

  @override
  void initState() {
    super.initState();
    _stepAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _stepAnimationController.dispose();
    super.dispose();
  }

  void _nextStep() {
    setState(() {
      if (_currentStep < widget.tutorial.steps.length - 1) {
        _currentStep++;
        _stepAnimationController.forward(from: 0);
      } else {
        _completed = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.tutorial.title)),
      body: AnimatedBuilder(
        animation: _stepAnimationController,
        builder: (_, child) {
          return Opacity(
            opacity: _stepAnimationController.value,
            child: Transform.translate(
              offset: Offset(50 * (1 - _stepAnimationController.value), 0),
              child: TutorialStepWidget(
                step: widget.tutorial.steps[_currentStep],
                tutorial: widget.tutorial,
                currentStep: _currentStep,
              ),
            ),
          );
        },
      ),
      // ... resto del código de navegación
    );
  }
}