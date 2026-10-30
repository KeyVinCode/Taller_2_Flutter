# UserMaster 🌲

Aplicación móvil de demostración con temática **scout**, hecha con **Flutter** y **Dart**.
Es una demo de interfaz: **no tiene backend**, todo (login, registro, recuperación) es simulado.

## ¿En qué consiste?

Una persona abre la app, ve una pantalla de bienvenida, inicia sesión (o se registra / recupera su contraseña), entra a una bitácora scout con tarjetas (campamentos, insignias, reuniones, avisos, servicio) y puede ver su perfil y cerrar sesión.

| Pantalla | Archivo | Qué hace |
|---|---|---|
| Splash | `splash_page.dart` | Logo sobre fondo verde, 3 segundos y pasa al login |
| Login | `login_page.dart` | Correo + contraseña, carga de 2 s y pasa al dashboard |
| Registro | `register_page.dart` | 4 campos, valida que las contraseñas coincidan y vuelve al login |
| Recuperar contraseña | `forgot_password_page.dart` | Pide el correo y muestra un `SnackBar` |
| Dashboard | `dashboard_page.dart` | `BottomNavigationBar` (Inicio / Perfil) y 5 tarjetas en un `ListView` |
| Perfil | `profile_page.dart` | Avatar, nombre, correo y botón rojo "Cerrar sesión" |

## Tecnologías

- **Flutter 3.47.7** y **Dart**
- **Estilo híbrido:** `MaterialApp` (Scaffold, Card, BottomNavigationBar, SnackBar) + widgets **Cupertino** (CupertinoTextField, CupertinoButton, CupertinoActivityIndicator, CupertinoIcons y transiciones estilo iOS)
- **Navegación:** `Navigator` con rutas nombradas (sin paquetes extra)
- **CI/CD:** GitHub Actions → GitHub Pages (Flutter Web)

## Estructura del proyecto

```
lib/
├── main.dart                  # Arranque de la app y tema
├── data/demo_user.dart        # Nombre y correo de ejemplo (Kevin)
├── routes/app_routes.dart     # Nombres de las rutas y sus pantallas
├── theme/app_colors.dart      # Paleta de colores
├── utils/validators.dart      # Validación simple de correo
├── widgets/
│   ├── primary_button.dart    # Botón reutilizable
│   └── custom_text_field.dart # Campo de texto reutilizable
└── pages/                     # Las 6 pantallas
.github/workflows/deploy.yml   # Despliegue automático a GitHub Pages
```

## Pasos que se siguieron

1. **Planeación:** se eligió el tema scout, el nombre `UserMaster`, la paleta (verde bosque, mostaza, beige) y el estilo híbrido Material + Cupertino.
2. **Crear el proyecto:** `flutter create user_master --platforms=web,android,ios`
3. **Colores y rutas:** `app_colors.dart` y `app_routes.dart`.
4. **Widgets reutilizables:** `PrimaryButton` y `CustomTextField`.
5. **Pantallas de autenticación:** splash, login, registro y recuperar contraseña (con validaciones del lado del cliente).
6. **Dashboard y perfil:** barra inferior, tarjetas y cierre de sesión que borra el historial.
7. **Despliegue:** workflow de GitHub Actions que compila Flutter Web y publica en GitHub Pages.

## Cómo ejecutarla

```bash
flutter pub get
flutter run -d chrome        # en el navegador
flutter run                  # en un emulador o celular conectado
```


El workflow toma el nombre del repositorio automáticamente para el `--base-href`, no hay que editar nada.

## Usuario de ejemplo

Nombre: **Kevin** · Correo: **kevin@usermaster.com**. El login acepta cualquier correo con formato válido y cualquier contraseña no vacía.
