import 'package:flutter/cupertino.dart';

import '../theme/app_colors.dart';

/// Botón principal de la app (estilo iOS). Se usa en todas las pantallas.
class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color color;

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.color = AppColors.primary,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CupertinoButton(
        color: color,
        borderRadius: BorderRadius.circular(12),
        // Si está cargando, el botón se desactiva (null = desactivado)
        onPressed: isLoading ? null : onPressed,
        child: isLoading
            ? const CupertinoActivityIndicator(color: CupertinoColors.white)
            : Text(
                text,
                style: const TextStyle(
                  color: CupertinoColors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }
}
