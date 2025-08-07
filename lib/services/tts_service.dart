import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/foundation.dart';

class TTSService {
  static final FlutterTts _tts = FlutterTts();

  static Future<void> init() async {
    await _tts.setEngine("com.google.android.tts");
    await _tts.setLanguage('es-ES');
    await _tts.setPitch(1.0);
  }

  static Future<void> speak(String text) async {
    try {
      if (!await _tts.isLanguageAvailable("es-ES")) {
        await init();
      }
      await _tts.speak(text);
    } catch (e) {
      debugPrint("Error en TTS: $e");
    }
  }
  static Future<void> hablao(String text) async {
    try {
      if (text.isEmpty) return;

      // Configuración adicional para mejor legibilidad
      await _tts.setSpeechRate(0.9); // Velocidad moderada
      await _tts.setVolume(1.0);     // Volumen máximo
      await _tts.awaitSpeakCompletion(true); // Espera a que termine

      await _tts.speak(text);
    } catch (e) {
      debugPrint("Error en TTS: $e");
      // Opcional: Reintentar o notificar al usuario
    }
  }

  static Future<void> stop() async => await _tts.stop();
}