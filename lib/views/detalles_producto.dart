import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detalles del Productos'),
      ),
      body:  Padding(
  padding: const EdgeInsets.all(16.0),
  child: Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        flex: 1,
        child: Image.asset(
          '../../assets/images/tarjetas_de_video/rtx-2060.png', // Ruta de la imagen del producto
          width: 150,
          height: 150,
          fit: BoxFit.cover, // Ajustar la imagen al tamaño del contenedor
        ),
      ),
      const SizedBox(width: 16),
      const Expanded(
        flex: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nombre del Producto',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text('Compañía'),
            SizedBox(height: 8),
            Text('Descripción'),
            SizedBox(height: 8),
            Text('Detalles Técnicos'),
          ],
        ),
      ),
    ],
  ),
),

    );
  }
}
