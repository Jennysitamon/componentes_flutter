import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pract3/screens/data_screen.dart';
import 'package:pract3/screens/home_screen.dart';
import 'package:pract3/screens/images_screen.dart';
import 'package:pract3/screens/infinite_scroll_screen.dart';
import 'package:pract3/screens/notifications_screen.dart';
import 'package:pract3/theme/app_theme.dart';
import 'package:pract3/models/usuario_data.dart';


class InputsScreen extends StatefulWidget {
  const InputsScreen({super.key});

  @override
  State<InputsScreen> createState() => _InputsScreenState();
}

class _InputsScreenState extends State<InputsScreen> {
  //controlador para campo de entrada de nombre
  TextEditingController nombreController = TextEditingController();
  //String? nombre;
  bool switchValue = false;
  double sliderValue = 0.0;
  int radioSelected = 0;
  bool isCheked1 = false;
  bool isCheked2 = false;
  bool isCheked3 = false;
  int indexNavigation = 0;

  openScreen(int index, BuildContext context) {
    MaterialPageRoute ruta =
        MaterialPageRoute(builder: (context) => const HomeScreen());
    switch (index) {
      case 0:
        ruta = MaterialPageRoute(builder: (context) => const HomeScreen());
        break;
      case 1:
        ruta = MaterialPageRoute(
            builder: (context) => const InfiniteScrollScreen());
        break;
      case 2:
        ruta = MaterialPageRoute(
            builder: (context) => const NotificationsScreen());
        break;
      case 3:
        ruta = MaterialPageRoute(builder: (context) => const ImagesScreen());
        break;
      case 4: 
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        //comportamiento solo en celulares
        
    }

    setState(() {
      indexNavigation = index;
      Navigator.push(context, ruta);
    });
  }

  //termina
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Entradas'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            entradaNombre(),
            entradaSwitch(),
            entradaSlider(),
            //nuevo hoy
            entradaRadio(),
            Text(
              '¿Qué usas para correr tus apps?',
              style: AppTheme.lightTheme.textTheme.headlineLarge,
            ),
            entradasCheck(),
            //termina nuevo
            //hacer que el boton funcione con datos: navig.push
            //BOTÓN PARA GUARDAR Y Q PASE A DATA
            ElevatedButton(
              onPressed: () {
                // instancia de usuario con los datos
                UsuarioData datos = UsuarioData(
                  nombre: nombreController.text,  //CONTROLADOOR 
                  gustaFlutter: switchValue,
                  valorFlutter: sliderValue,
                  preferenciaMovil: radioSelected,
                  navegador: isCheked1,
                  emulador: isCheked2,
                  smartphone: isCheked3,
                );
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DataScreen(datos: datos)),
                );
              },
              child: const Text('Guardar'),
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

  //función para la entrada de nombre
  TextField entradaNombre() {
    return TextField(
      controller: nombreController,  
      style: AppTheme.lightTheme.textTheme.headlineMedium,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        labelText: 'Escribe tu nombre:',
        labelStyle: AppTheme.lightTheme.textTheme.headlineLarge,
      ),
    );
  }

  Row entradaSwitch() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          '¿Te gusta Flutter?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Switch(
            value: switchValue,
            onChanged: (value) {
              setState(() {
                //Sufrir cambios mandar a llamar <---
                switchValue = value;
              });
            }),
      ],
    );
  }

  Column entradaSlider() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Indica qué tanto te gusta Flutter: ',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        Slider(
            min: 0.0,
            max: 10.0,
            divisions: 10,
            label: '${sliderValue.round()}',
            activeColor: const Color.fromARGB(223, 170, 83, 170),
            thumbColor: AppTheme.secondaryColor,
            inactiveColor: AppTheme.backColor,
            value: sliderValue,
            onChanged: (value) {
              setState(() {
                sliderValue = value;
                //print('Se cambio el slider: $sliderValue');
              });
            })
      ],
    );
  }

  //nuevo hoy
  Column entradaRadio() {
    return Column(
      children: [
        Text(
          '¿Qué prefieres para desarrollo movil?',
          style: AppTheme.lightTheme.textTheme.headlineLarge,
        ),
        ListTile(
          title: Text(
            'Kotlin',
            style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 1,
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected = value!;
                  //print('Selección del botón radio: $radioSelected');
                });
              },
            ),
          ),
        ),
        ListTile(
          title: Text(
            'Flutter',
            style: AppTheme.lightTheme.textTheme.headlineSmall,
          ),
          leading: Transform.scale(
            scale: 1.5,
            child: Radio(
              value: 2,
              groupValue: radioSelected,
              onChanged: (value) {
                setState(() {
                  radioSelected = value!;
                  //print('Selección del botón radio: $radioSelected');
                });
              },
            ),
          ),
        ),
      ],
    );
  }

  //termina
  //nuevohoy
  Row entradasCheck() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          'Navegador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isCheked1,
            onChanged: (value) {
              setState(() {
                isCheked1 = value!;
              });
            },
          ),
        ),
        Text(
          'Emulador',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isCheked2,
            onChanged: (value) {
              setState(() {
                isCheked2 = value!;
              });
            },
          ),
        ),
        Text(
          'SmartPhone',
          style: AppTheme.lightTheme.textTheme.bodySmall,
        ),
        Transform.scale(
          scale: 1.5,
          child: Checkbox(
            value: isCheked3,
            onChanged: (value) {
              setState(() {
                isCheked3 = value!;
              });
            },
          ),
        ),
      ],
    );
  }
}
