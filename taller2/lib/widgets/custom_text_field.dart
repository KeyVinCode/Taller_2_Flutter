import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../theme/app_colors.dart';

/// Campo de texto reutilizable: etiqueta + caja + mensaje de error.
class CustomTextField extends StatefulWidget {
  final String label;
  final String placeholder;
  final IconData icon;
  final TextEditingController controller;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? errorText;

  const CustomTextField({
    super.key,
    required this.label,
    required this.placeholder,
    required this.icon,
    required this.controller,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.errorText,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _oculto = true; // para el ojito de la contraseña

  @override
  Widget build(BuildContext context) {
    final hayError = widget.errorText != null;

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: const TextStyle(
              color: AppColors.textDark,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 6),
          CupertinoTextField(
            controller: widget.controller,
            placeholder: widget.placeholder,
            keyboardType: widget.keyboardType,
            obscureText: widget.isPassword && _oculto,
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 8),
            prefix: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(widget.icon, color: AppColors.primary, size: 20),
            ),
            suffix: widget.isPassword
                ? GestureDetector(
                    onTap: () => setState(() => _oculto = !_oculto),
                    child: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(
                        _oculto ? CupertinoIcons.eye : CupertinoIcons.eye_slash,
                        color: AppColors.textLight,
                        size: 20,
                      ),
                    ),
                  )
                : null,
            decoration: BoxDecoration(
              color: AppColors.surface,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: hayError ? AppColors.danger : Colors.black12,
              ),
            ),
          ),
          if (hayError)
            Padding(
              padding: const EdgeInsets.only(top: 4, left: 4),
              child: Text(
                widget.errorText!,
                style: const TextStyle(color: AppColors.danger, fontSize: 12),
              ),
            ),
        ],
      ),
    );
  }
}
