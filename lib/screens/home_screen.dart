import 'package:flutter/material.dart';
import 'package:pract3/theme/app_theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Componentes de Flutter'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            title: Text(
              'Entradas',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            subtitle: Text(
              'Introducción de valores',
               style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
            leading: const Icon(Icons.rocket_launch),
            trailing: const Icon(Icons.arrow_circle_right_rounded),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'ListView.builder',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            subtitle: Text(
              'Lista con desplazamiento infinito',
               style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
            leading: const Icon(Icons.format_list_bulleted),
            trailing: const Icon(Icons.arrow_circle_right_rounded),
          ),
          const Divider(),
          ListTile(
            title: Text(
              'Notificaciones',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            subtitle: Text(
              'Mostrar una notificación',
               style: AppTheme.lightTheme.textTheme.bodySmall,
              ),
            leading: const Icon(Icons.notifications_active),
            trailing: const Icon(Icons.arrow_circle_right_rounded),
          ),
        ],
      ),
    );
  }
}
