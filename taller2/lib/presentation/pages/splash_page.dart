import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Después de exactamente 3 segundos, pasamos al login
    _timer = Timer(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.pushReplacementNamed(context, AppRoutes.login);
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 1. Foto de campamento de fondo
          Image.asset(
            'assets/images/campamento.jpg',
            fit: BoxFit.cover,
            // Si la foto no existe, no se rompe: se ve el fondo verde
            errorBuilder: (context, error, stackTrace) =>
                const SizedBox.shrink(),
          ),

          // 2. Capa verde oscura encima para que el texto se lea bien
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0x802E5339), Color(0xE62E5339)],
              ),
            ),
          ),

          // 3. Logo y nombre en el centro
          const Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.forest, size: 110, color: AppColors.accent),
                SizedBox(height: 16),
                Text(
                  'UserMaster',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // 4. Indicador de carga abajo
          const Positioned(
            left: 0,
            right: 0,
            bottom: 60,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CupertinoActivityIndicator(
                  radius: 14,
                  color: Colors.white,
                ),
                SizedBox(height: 12),
                Text(
                  'Cargando...',
                  style: TextStyle(color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}