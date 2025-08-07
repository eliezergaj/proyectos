class Tutorial {
  final String id;
  final String title;
  final String icon;
  final List<TutorialStep> steps;
  final int totalSteps;

  Tutorial({
    required this.id,
    required this.title,
    required this.icon,
    required this.steps,
  }) : totalSteps = steps.length;
}

class TutorialStep {
  final int stepNumber;
  final String instruction;
  final String? imagePath;
  final String? audioPath; // Para instrucciones por voz

  TutorialStep({
    required this.stepNumber,
    required this.instruction,
    this.imagePath,
    this.audioPath,
  });
}