import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'routes/app_routes.dart';   // las rutas
import 'theme/app_colors.dart';    // los colores

void main() {
  runApp(const UserMasterApp());
}

class UserMasterApp extends StatelessWidget {
  const UserMasterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'UserMaster',
      debugShowCheckedModeBanner: false,

      // TEMA: colores y transiciones estilo iOS
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primary,
          primary: AppColors.primary,
        ),
        scaffoldBackgroundColor: AppColors.background,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: CupertinoPageTransitionsBuilder(),
            TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
            TargetPlatform.windows: CupertinoPageTransitionsBuilder(),
            TargetPlatform.linux: CupertinoPageTransitionsBuilder(),
          },
        ),
      ),

      // RUTAS: con qué pantalla arranca y la tabla de pantallas
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.routes,
    );
  }
}