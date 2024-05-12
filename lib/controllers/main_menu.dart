import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:porteco/controllers/exports.dart';
import 'package:porteco/views/export_views.dart';

import '../controllers/settings.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Product> products = [
      Product(
        imagePath: '../../assets/images/tarjetas_de_video/rtx-2060.png',
        company: 'Company 1',
        name: 'Product 1',
        price: 19.99,
      ),
      Product(
        imagePath: '../../assets/images/tarjetas_de_video/rtx-2060.png',
        company: 'Company 2',
        name: 'Product 2',
        price: 29.99,
      ),
      Product(
        imagePath: '../../assets/images/tarjetas_de_video/rtx-2060.png',
        company: 'Company 3',
        name: 'Product 3',
        price: 39.99,
      ),
      Product(
        imagePath: '../../assets/images/tarjetas_de_video/rtx-2060.png',
        company: 'Company 4',
        name: 'Product 4',
        price: 39.99,
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PORTECO',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('../../assets/images/logo.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: null,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Buscar categorías',
                  prefixIcon: Icon(Icons.search),
                ),
                onChanged: (value) {
                  // Implementa la lógica de búsqueda de categorías aquí
                },
              ),
            ),
            ListTile(
              title: Text('Procesador'),
              onTap: () {
                // Acción al seleccionar la opción "Procesador"
              },
            ),
            ListTile(
              title: Text('Placa Madre'),
              onTap: () {
                // Acción al seleccionar la opción "Placa Madre"
              },
            ),
            ListTile(
              title: Text('Tarjeta de Video'),
              onTap: () {
                // Acción al seleccionar la opción "Tarjeta de Video"
              },
            ),
            ListTile(
              title: Text('Categorías'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CategoriesScreen()),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 15),
          const CarouselSliderWidget(),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '¡Bienvenido!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'Nuevos productos:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: products.map((product) {
                  return GestureDetector(
                    child: ProductCard(
                      product: product,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const ProductDetailsPage()),
                        );
                      },
                    ),
                    // Aquí agregamos ProductCard
                  );
                }).toList(),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: const Icon(Icons.shopping_cart, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>  ConfigurationPage()),
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.account_circle, color: Colors.white),
              onPressed: () async {
                final FirebaseAuth _auth = FirebaseAuth.instance;
                final User? user = _auth.currentUser;
                if (user != null) {
                  // Si hay un usuario autenticado, navega al perfil
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PerfilPage(user: user)),
                  );
                } else {
                  // Si no hay un usuario autenticado, navega a la página de inicio de sesión
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginPage()),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
