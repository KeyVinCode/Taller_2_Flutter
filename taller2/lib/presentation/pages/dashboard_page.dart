import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/demo_user.dart';
import '../../theme/app_colors.dart';
import 'profile_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  int _indice = 0; // 0 = Inicio, 1 = Perfil

  final List<Widget> _pestanas = const [
    _InicioTab(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pestanas[_indice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indice,
        onTap: (i) => setState(() => _indice = i),
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textLight,
        backgroundColor: AppColors.surface,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}

/// Un elemento de la bitácora scout (datos de ejemplo).
class _Aviso {
  final IconData icono;
  final String titulo;
  final String detalle;
  const _Aviso(this.icono, this.titulo, this.detalle);
}

const List<_Aviso> _avisos = [
  _Aviso(Icons.terrain, 'Campamento de fin de semana',
      'Sábado 8 de noviembre · Reserva Natural El Retiro'),
  _Aviso(Icons.military_tech, 'Nueva insignia obtenida',
      'Felicitaciones: Nudos y amarres'),
  _Aviso(Icons.groups, 'Reunión de patrulla',
      'Jueves 6:00 p. m. · Sede de la tropa'),
  _Aviso(Icons.campaign, 'Aviso de la tropa',
      'Recuerda el pago de cuotas y el uniforme completo'),
  _Aviso(Icons.volunteer_activism, 'Actividad de servicio comunitario',
      'Jornada de limpieza del parque · Domingo 9:00 a. m.'),
];

class _InicioTab extends StatelessWidget {
  const _InicioTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 20, 20, 4),
            child: Text(
              'Hola, $demoUserName',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 12),
            child: Text(
              'Tu bitácora reciente',
              style: TextStyle(color: AppColors.textLight),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: _avisos.length,
              itemBuilder: (context, i) {
                final aviso = _avisos[i];
                return Card(
                  color: AppColors.surface,
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(12),
                    leading: CircleAvatar(
                      backgroundColor: AppColors.accent,
                      child: Icon(aviso.icono, color: Colors.white),
                    ),
                    title: Text(
                      aviso.titulo,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(aviso.detalle),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
