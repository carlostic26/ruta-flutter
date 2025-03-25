import 'package:flutter/material.dart';

class AppSupport extends StatelessWidget {
  const AppSupport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Ilustración/icono
            Icon(
              Icons.volunteer_activism,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 30),

            // Mensaje principal
            const Text(
              '¡Tu apoyo hace la diferencia!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),

            // Descripción
            const Text(
              'Hemos invertido cientos de horas desarrollando RutaFlutter para crear la mejor '
              'experiencia de aprendizaje. Con tu apoyo podremos seguir mejorando la app, '
              'añadiendo nuevo contenido y manteniendo todo actualizado.',
              style: TextStyle(
                fontSize: 16,
                height: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),

            _buildBenefit(Icons.update, 'Actualizaciones frecuentes'),
            _buildBenefit(Icons.code, 'Nuevos ejemplos de código'),
            _buildBenefit(Icons.quiz, 'Más exámenes prácticos'),
            const SizedBox(height: 40),

            ElevatedButton.icon(
              onPressed: () {
                // _showRewardedAd();
              },
              icon: const Icon(Icons.visibility, size: 24),
              label: const Text(
                'APOYAR',
                style: TextStyle(fontSize: 18),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            const SizedBox(height: 12),

            // Texto pequeño
            const Text(
              'Verás una breve propaganda y recibirás nuestro agradecimiento',
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBenefit(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
