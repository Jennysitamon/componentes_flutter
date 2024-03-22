import 'package:flutter/material.dart';
import 'package:pract3/screens/home_screen.dart';
import 'package:pract3/screens/images_screen.dart';
import 'package:pract3/theme/app_theme.dart';
import 'package:pract3/screens/infinite_scroll_screen.dart';


class NotificationsScreen extends StatefulWidget{
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreen();
}

class _NotificationsScreen extends State<NotificationsScreen> {

  int indexNavigation = 0;

  openScreen(index, BuildContext context){
    MaterialPageRoute ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
    switch(index){
      case 0:
      ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
      break;
      case 1:
       ruta = MaterialPageRoute(builder: (context) => const InfiniteScrollScreen());
      break;
      case 2:
      ruta = MaterialPageRoute(builder: (context) => const NotificationsScreen());
      break;
      case 3:
      ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
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
        title: const Text('Notificaciones'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Aquí puedes agregar otros widgets si los necesitas
            ElevatedButton(
              onPressed: () {
                // Acción al presionar el botón
              },
              child: const Text('Enviar Noti'),
            ),
          ],
        ),
      ), 
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: indexNavigation,
        backgroundColor: const Color.fromARGB(223, 234, 132, 180),
        unselectedItemColor: AppTheme.primaryColor,
        selectedItemColor: AppTheme.backColor2,
        unselectedLabelStyle: const TextStyle(color: AppTheme.backColor2),
        onTap: (index) => openScreen(index, context),
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