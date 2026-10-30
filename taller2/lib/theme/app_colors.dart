import 'package:flutter/material.dart';

/// Paleta de colores de UserMaster (tema scout).
/// Si quieres cambiar un color de TODA la app, lo cambias solo aquí.
class AppColors {
  AppColors._(); // evita que alguien cree un "AppColors()"

  static const Color primary = Color(0xFF2E5339); // verde bosque
  static const Color accent = Color(0xFFD9A441); // mostaza (pañoleta)
  static const Color background = Color(0xFFF3EBDD); // beige tierra
  static const Color surface = Colors.white;
  static const Color textDark = Color(0xFF2B2B2B);
  static const Color textLight = Color(0xFF6B6B6B);
  static const Color danger = Color(0xFFC62828); // rojo (cerrar sesión)
}
