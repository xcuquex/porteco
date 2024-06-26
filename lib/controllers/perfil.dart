import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'exports.dart';

class PerfilPage extends StatelessWidget {
  final User user;

  const PerfilPage({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Perfil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/usuario.png'),
                ),
                const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Nombre de Usuario', // Agrega el nombre de usuario
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      user.email!, // Utiliza el correo electrónico del usuario
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Acción para el botón "Editar Perfil"
                  },
                  child: const Text('Editar Perfil'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
                    );
                  },
                  child: const Text('Carrito de compras'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Compras Recientes',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5, // Número de compras recientes
                itemBuilder: (context, index) {
                  // Aquí puedes rellenar cada elemento del slider con información de compras recientes
                  return Container(
                    width: 150,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    color: Colors.grey[300],
                    child: Center(
                      child: Text('Compra $index'),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Historial de compras'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Cerrar sesión
                _signOut(context);
              },
              child: const Text('Cerrar sesión'),
            ),
          ],
        ),
      ),
    );
  }

  // Método para cerrar sesión
  void _signOut(BuildContext context) async {
    try {
      await FirebaseAuth.instance.signOut();
      // Navegar de regreso a la página de inicio o a la página de inicio de sesión
      Navigator.of(context).popUntil((route) => route.isFirst);
    } catch (e) {
      print('Error al cerrar sesión: $e');
    }
  }
}
