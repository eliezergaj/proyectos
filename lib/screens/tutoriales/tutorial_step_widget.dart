import 'package:flutter/material.dart';
import 'package:acompanatech/models/tutorial_model.dart';

class TutorialStepWidget extends StatefulWidget {
  final TutorialStep step;
  final Tutorial tutorial;
  final int currentStep;

  const TutorialStepWidget({
    super.key,
    required this.step,
    required this.tutorial,
    required this.currentStep,
  });

  @override
  State<TutorialStepWidget> createState() => _TutorialStepWidgetState();
}

class _TutorialStepWidgetState extends State<TutorialStepWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // Indicador de progreso
          Row(
            children: List.generate(
              widget.tutorial.totalSteps,
                  (index) => Expanded(
                child: Container(
                  height: 4,
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: index <= widget.currentStep
                        ? Colors.blue
                        : Colors.grey[300],
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          if (widget.step.imagePath != null)
            Image.asset(widget.step.imagePath!, height: 200),

          const SizedBox(height: 20),

          Text(
            "Paso ${widget.step.stepNumber}",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 16),

          Text(
            widget.step.instruction,
            style: const TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}