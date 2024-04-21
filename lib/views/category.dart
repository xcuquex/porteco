import 'package:flutter/material.dart';
import '../controllers/category_end.dart';
import 'case.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorías'),
      ),
      body: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(16),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.7,
        children: [
          CategoryPage(
            imagePath: 'assets/images/ram.png',
            categoryName: 'RAM',
            onTap: () {
            },
          ),
          CategoryPage(
            imagePath: 'assets/images/mouse.png',
            categoryName: 'Mouse',
            onTap: () {
            },
          ),
          CategoryPage(
            imagePath: 'assets/images/audifonos.png',
            categoryName: 'Audífonos',
            onTap: () {
            },
          ),
          CategoryPage(
            imagePath: 'assets/images/almacenamiento.png',
            categoryName: 'Almacenamiento',
            onTap: () {
            },
          ),
          CategoryPage(
            imagePath: 'assets/images/microfono.png', 
            categoryName: 'Microfonos', 
            onTap: () {
            },
            ),
            CategoryPage(
            imagePath: 'assets/images/monitor.png', 
            categoryName: 'Monitores', 
            onTap: () {
            },
            ),
            CategoryPage(
            imagePath: 'assets/images/teclado.png', 
            categoryName: 'Teclados', 
            onTap: () {
            },
            ),
            CategoryPage(
            imagePath: 'assets/images/case.png',
            categoryName: 'Case de computador',
            onTap: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CaseComputerPage()),
                    );
            },
            ),
            CategoryPage(
            imagePath: 'assets/images/motherboard.png',
            categoryName: 'MotherBoard',
            onTap: (){
              Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CaseComputerPage()),
                    );
            },
            ),
            CategoryPage(
              imagePath: 'assets/images/procesador.png', 
              categoryName: 'Procesadores', 
              onTap: (){
            },
            ),
            CategoryPage(
              imagePath: 'assets/images/tarjeta.png', 
              categoryName: 'Tarjetas de video', 
              onTap: (){
            },
            ),
          ],
        ),
      );
  }
}

void main() {
  runApp(const MaterialApp(
    home: CategoriesScreen(),
  ));
}
