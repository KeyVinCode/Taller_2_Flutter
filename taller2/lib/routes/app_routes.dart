import 'package:flutter/material.dart';

// import '../pages/dashboard_page.dart';
// import '../pages/forgot_password_page.dart';
import '../presentation/pages/login_page.dart';
// import '../pages/register_page.dart';
// import '../pages/splash_page.dart';

/// Aquí se centralizan los nombres de las pantallas (rutas).
class AppRoutes {
  AppRoutes._();

  static const String splash = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String forgotPassword = '/forgot-password';
  static const String dashboard = '/dashboard';

  /// Tabla que relaciona cada nombre con su pantalla.
  static Map<String, WidgetBuilder> get routes => {
        // splash: (context) => const SplashPage(),
        login: (context) => const LoginPage(),
      //   register: (context) => const RegisterPage(),
      //   forgotPassword: (context) => const ForgotPasswordPage(),
      //   dashboard: (context) => const DashboardPage(),
      };
}
