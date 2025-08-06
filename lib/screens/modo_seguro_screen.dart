import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ModoSeguroScreen extends StatefulWidget {
  const ModoSeguroScreen({super.key});

  @override
  State createState() => _ModoSeguroScreenState();
}

class _ModoSeguroScreenState extends State {
  String _estadoActual = 'Configuración predeterminada';

  @override
  void initState() {
    super.initState();
    _cargarPuntoRestauracion();
  }

  Future _cargarPuntoRestauracion() async {
    final prefs = await SharedPreferences.getInstance();
    if (!mounted) return;
    setState(() {
      _estadoActual = prefs.getString('modoSeguro_estado') ?? 'Configuración predeterminada';
    });
  }

  Future _guardarPuntoRestauracion() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('modoSeguro_estado', _estadoActual);
    if (!mounted) return;
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Punto de restauración guardado')),
    );
  }

  Future _restaurarPuntoGuardado() async {
    final prefs = await SharedPreferences.getInstance();
    final restaurado = prefs.getString('modoSeguro_estado');
    if (!mounted) return;
    setState(() {
      _estadoActual = restaurado ?? 'No hay punto guardado';
    });
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Restaurado al punto guardado')),
    );
  }

  void _modificarEstadoEjemplo() {
    setState(() {
      _estadoActual = 'Estado cambiado por el usuario a las ${DateTime.now().hour}:${DateTime.now().minute}';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modo Seguro'),
        backgroundColor: const Color(0xFF1D3557),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Modo seguro del dispositivo',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            Text('Estado actual: $_estadoActual'),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              icon: const Icon(Icons.save),
              label: const Text('Crear punto de restauración'),
              onPressed: _guardarPuntoRestauracion,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.restore),
              label: const Text('Restaurar último punto'),
              onPressed: _restaurarPuntoGuardado,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Simular cambio de estado'),
              onPressed: _modificarEstadoEjemplo,
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text('Ajustes del tutor (bloqueado)'),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Función exclusiva para tutores.')),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}


