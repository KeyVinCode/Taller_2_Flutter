import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import '../../utils/validators.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/primary_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nombreController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  String? _nombreError;
  String? _emailError;
  String? _passwordError;
  String? _confirmError;
  bool _cargando = false;

  @override
  void dispose() {
    _nombreController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _crearCuenta() async {
    setState(() {
      _nombreError =
          _nombreController.text.trim().isEmpty ? 'Escribe tu nombre' : null;
      _emailError =
          esCorreoValido(_emailController.text) ? null : 'Escribe un correo válido';
      _passwordError = _passwordController.text.length < 6
          ? 'Mínimo 6 caracteres'
          : null;
      // Aquí se valida que las contraseñas coincidan
      _confirmError = _confirmController.text != _passwordController.text
          ? 'Las contraseñas no coinciden'
          : null;
    });
    if (_nombreError != null ||
        _emailError != null ||
        _passwordError != null ||
        _confirmError != null) {
      return;
    }

    // Simulamos el registro (1 segundo)
    setState(() => _cargando = true);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Cuenta creada. ¡Ya puedes ingresar!')),
    );
    Navigator.pop(context); // volvemos al Login
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Crear cuenta'),
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.primary,
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 420),
              child: Column(
                children: [
                  CustomTextField(
                    label: 'Nombre completo',
                    placeholder: 'Kevin Pérez',
                    icon: CupertinoIcons.person,
                    controller: _nombreController,
                    errorText: _nombreError,
                  ),
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
                    placeholder: 'Mínimo 6 caracteres',
                    icon: CupertinoIcons.lock,
                    controller: _passwordController,
                    isPassword: true,
                    errorText: _passwordError,
                  ),
                  CustomTextField(
                    label: 'Confirmar contraseña',
                    placeholder: 'Repite tu contraseña',
                    icon: CupertinoIcons.lock_shield,
                    controller: _confirmController,
                    isPassword: true,
                    errorText: _confirmError,
                  ),
                  const SizedBox(height: 8),
                  PrimaryButton(
                    text: 'Crear cuenta',
                    isLoading: _cargando,
                    onPressed: _crearCuenta,
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
