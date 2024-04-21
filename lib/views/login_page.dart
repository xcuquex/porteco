import 'package:flutter/material.dart';
import '../main.dart'; 
import '../controllers/main_menu.dart';
import '../controllers/perfil.dart';
void main() {
  runApp(const MyApp());
}

class login extends StatelessWidget {
  const login({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginPage(),
        '/': (context) => const MainMenu(), 
      },
    );
  }
}
class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesion'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Image.asset(
                  'assets/images/usuario.png', 
                  width: 150, 
                  height: 150, 
                ),
              ),
              const TextField(
                decoration: InputDecoration(labelText: 'Usuario'),
              ),
              const SizedBox(height: 20),
              const TextField(
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Navegar a la página de perfil al presionar el botón
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilPage()),
                  );
                },
                child: const Text('Iniciar sesión'),

              ),
            ],
          ),
        ),
      ),
    );
  }
}


