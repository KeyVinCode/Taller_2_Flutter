import 'package:flutter/material.dart';

import '../../data/demo_user.dart';
import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../widgets/primary_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  void _cerrarSesion(BuildContext context) {
    // Borra TODO el historial de pantallas y deja solo el Login
    Navigator.pushNamedAndRemoveUntil(
      context,
      AppRoutes.login,
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 420),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircleAvatar(
                  radius: 56,
                  backgroundColor: AppColors.primary,
                  child: Icon(Icons.person, size: 64, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  demoUserName,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textDark,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  demoUserEmail,
                  style: TextStyle(color: AppColors.textLight),
                ),
                const SizedBox(height: 40),
                PrimaryButton(
                  text: 'Cerrar sesión',
                  color: AppColors.danger,
                  onPressed: () => _cerrarSesion(context),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
