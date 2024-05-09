import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:porteco/firebase_options.dart';

class ConfigurationPage extends StatefulWidget {
  const ConfigurationPage({ super.key });
  @override
  _ConfigurationPageState createState() => _ConfigurationPageState();
}

class _ConfigurationPageState extends State<ConfigurationPage> {
  bool _modoOscuro = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Cambio de idioma'),
            trailing: const Icon(Icons.language),
            onTap: () {
              _mostrarDialogoIdioma(context);
            },
          ),
          SwitchListTile(
            title: const Text('Modo oscuro'),
            value: _modoOscuro,
            onChanged: (value) {
              setState(() {
                _modoOscuro = value;
                _cambiarTema();
              });
            },
          ),
          ListTile(
            title: const Text('copyrigth'),
            trailing: const Icon(Icons.info),
            onTap: () {
              _mostrarCreador(context);
            },
          ),
        ],
      ),
    );
  }

  void _cambiarTema() {
    if (_modoOscuro) {
      MyApp.setTema(ThemeData.dark());
    } else {
      MyApp.setTema(ThemeData.light());
    }
  }
}

void _mostrarCreador(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Creador'),
          content: Text('Creador: Erick David Cuque Ortiz'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
  void _mostrarDialogoIdioma(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SimpleDialog(
          title: Text('Seleccionar idioma'),
          children: [
            SimpleDialogOption(
              onPressed: () {
                // Lógica para cambiar a inglés
                Navigator.pop(context);
              },
              child: Text('Inglés'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Lógica para cambiar a español
                Navigator.pop(context);
              },
              child: Text('Español'),
            ),
            SimpleDialogOption(
              onPressed: () {
                // Lógica para cambiar a portugués
                Navigator.pop(context);
              },
              child: Text('Portugués'),
            ),
          ],
        );
      },
    );
  }

class MyApp extends StatelessWidget {
  static ThemeData tema = ThemeData.light();

  static void setTema(ThemeData nuevoTema) {
    tema = nuevoTema;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'settings',
      theme: tema,
      home: ConfigurationPage(),
    );
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}