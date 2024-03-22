import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pract3/models/usuario_data.dart';
import 'package:pract3/screens/home_screen.dart';
import 'package:pract3/screens/infinite_scroll_screen.dart';
import 'package:pract3/screens/images_screen.dart';
import 'package:pract3/theme/app_theme.dart';

class DataScreen extends StatefulWidget {
  final UsuarioData datos;

  const DataScreen({Key? key, required this.datos}) : super(key: key);

  @override
  State<DataScreen> createState() => _DataScreenState();
}

class _DataScreenState extends State<DataScreen> {
  int indexNavigation = 0;

  openScreen(int index) {
    MaterialPageRoute ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(builder: (context) => const InfiniteScrollScreen());
        break;
      case 2:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
    }
    setState(() {
      indexNavigation = index;
      Navigator.push(context, ruta);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos de las entradas'),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Nombre: ${widget.datos.nombre}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 94, 13, 60),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              '¿Te gusta Flutter?: ${widget.datos.gustaFlutter}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 202, 101, 101),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Valor Flutter: ${widget.datos.valorFlutter}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 144, 33, 167),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Preferencia de desarrollo móvil: ${widget.datos.preferenciaMovil == 1 ? 'Kotlin' : 'Flutter'}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 87, 53, 66),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Navegador: ${widget.datos.navegador}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 96, 52, 102),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Emulador: ${widget.datos.emulador}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 175, 66, 170),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Text(
              'Smartphone: ${widget.datos.smartphone}',
              style: GoogleFonts.caveat(
                textStyle: const TextStyle(
                  color: Color.fromARGB(255, 154, 73, 156),
                  fontSize: 28.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNavigation,
        backgroundColor: AppTheme.primaryColor,
        unselectedItemColor: AppTheme.backColor2,
        selectedItemColor: AppTheme.secondaryColor,
        unselectedLabelStyle: const TextStyle(color: AppTheme.backColor2),
        onTap: (index) => openScreen(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.cottage),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt_rounded),
            label: 'Lista',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notification_add_outlined),
            label: 'Notificación',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.image),
            label: 'Imagenes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.exit_to_app_rounded),
            label: 'Salida',
          ),
        ],
      ),
    );
  }
}

