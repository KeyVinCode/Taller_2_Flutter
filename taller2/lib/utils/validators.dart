/// Validaciones simples del lado del cliente (solo para la demo).
bool esCorreoValido(String texto) {
  final correo = texto.trim();
  return correo.contains('@') && correo.contains('.');
}