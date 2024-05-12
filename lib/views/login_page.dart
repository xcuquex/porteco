import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:porteco/controllers/perfil.dart';
import 'package:porteco/views/register_page.dart';

class LoginPage extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context) async {
    try {
      final String email = _emailController.text.trim();
      final String password = _passwordController.text.trim();

      // Verificar las credenciales del usuario
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // Si el inicio de sesión es exitoso, navega a la página de perfil
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => PerfilPage(user: userCredential.user!)),
      );
    } catch (e) {
      // Mostrar un mensaje de error utilizando un AlertDialog
      String errorMessage = 'Correo o contraseña incorrectos.';
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error al iniciar sesión'),
            content: Text(errorMessage),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Aceptar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imagen
              Image.asset(
                'assets/images/usuario.png',
                width: 150,
                height: 150,
              ),
              const SizedBox(height: 20),
              // Formulario de inicio de sesión
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo electrónico'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              // Botones dentro de un Row para colocarlos uno al lado del otro
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Iniciar sesión con el correo electrónico y la contraseña proporcionados
                      _signInWithEmailAndPassword(context);
                    },
                    child: const Text('Iniciar sesión'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Acción al presionar el botón de registrarse
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()),
                      );
                    },
                    child: const Text('Registrarse'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
