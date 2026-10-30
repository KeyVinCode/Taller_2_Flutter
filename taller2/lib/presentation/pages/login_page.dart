import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../routes/app_routes.dart';
import '../../theme/app_colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  String? _emailError;
  String? _passwordError;
  bool _cargando = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _ingresar() async {
    // 1. Validamos lo que escribió la persona
    setState(() {
      _emailError =
          esCorreoValido(_emailController.text) ? null : 'Escribe un correo válido';
      _passwordError =
          _passwordController.text.isEmpty ? 'Escribe tu contraseña' : null;
    });
    if (_emailError != null || _passwordError != null) return;

    // 2. Simulamos una carga de 2 segundos
    setState(() => _cargando = true);
    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    // 3. Vamos al dashboard (reemplazando el login)
    Navigator.pushReplacementNamed(context, AppRoutes.dashboard);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Icon(Icons.forest, size: 80, color: AppColors.primary),
                  const SizedBox(height: 8),
                  const Text(
                    'Bienvenido a UserMaster',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textDark,
                    ),
                  ),
                  const SizedBox(height: 32),
                  CustomTextField(
                    label: 'Correo electrónico',
                    placeholder: 'kevin@usermaster.com',
                    icon: CupertinoIcons.mail,
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    errorText: _emailError,
                  ),
                  CustomTextField(
                    label: 'Contraseña',
                    placeholder: '••••••••',
                    icon: CupertinoIcons.lock,
                    controller: _passwordController,
                    isPassword: true,
                    errorText: _passwordError,
                  ),
                  const SizedBox(height: 8),
                  PrimaryButton(
                    text: 'Ingresar',
                    isLoading: _cargando,
                    onPressed: _ingresar,
                  ),
                  const SizedBox(height: 12),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.forgotPassword),
                    child: const Text('¿Olvidaste tu contraseña?'),
                  ),
                  TextButton(
                    onPressed: () =>
                        Navigator.pushNamed(context, AppRoutes.register),
                    child: const Text('¿No tienes cuenta? Registrarse'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
