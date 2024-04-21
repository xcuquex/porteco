import 'package:flutter/material.dart';
import 'package:porteco/views/login_page.dart';
import 'package:porteco/controllers/exports.dart';
import 'ProductCard.dart';
import '../views/detalles_producto.dart';

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
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Image.asset(
                'assets/images/logo.png',
                width: 200,
                height: 200,
              ),
            ),
            const Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: TextField(
                  decoration: InputDecoration(
                  labelText: 'Buscar componentes',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ExpansionTile(
              title: const Text('Componentes'),
              children: <Widget>[
                
                ListTile(
                  title: const Text('Case de Computador'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CaseComputerPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('MotherBoard'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MotherBoardPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text ('Procesadores'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MotherBoardPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text ('Tarjetas de video'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const MotherBoardPage()),
                    );
                  },
                ),
                ListTile(
                  title: const Text('Otros'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          const SizedBox(height: 15),
          const CarouselSliderWidget(),
          const SizedBox(height: 15),
          const Row(
              children: [
                  Text(
                  '  ¡Bienvenido!',
                  style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Text(
            'Nuevos productos:',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Divider(
            color: Colors.grey,
            thickness: 1,
          ),
          Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                padding: const EdgeInsets.all(16),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: products.map((product) {
                  return ProductCard(product: product,
                  onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ProductDetailsPage()),
                      );
                    },
                    
                  );
                }).toList(),
              ),
            ),
          Container(
  color: Colors.black,
  padding: const EdgeInsets.all(16),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ShoppingCartPage()),
                );
          // Acción para el botón de carrito de compras
        },
      ),
      IconButton(
        icon: Icon(Icons.settings, color: Colors.white),
        onPressed: () {
          // Acción para el botón de opciones
                },
                ),
              IconButton(
                icon: Icon(Icons.account_circle, color: Colors.white),
                onPressed: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
          // Acción para el botón de cuenta
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
