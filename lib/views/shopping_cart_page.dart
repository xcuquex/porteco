import 'package:flutter/material.dart';

class ShoppingCartPage extends StatelessWidget {
  const ShoppingCartPage({super.key});
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito de Compras'),
      ),
      body: ListView.builder(
        itemCount: 1, // Número de productos en el carrito
        itemBuilder: (context, index) {
          var producto = {
            
            'imagen': '../../assets/images/tarjetas_de_video/rtx-2060.png', // Ruta de la imagen
            'descripcion': 'Descripción del producto $index', // Descripción del producto
            'precio': 10.0, // Precio del producto
            'cantidad': 1, // Cantidad del producto en el carrito
          };

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
                children: [
                  Image.asset(
                  (producto['imagen'] as String), // Conversión aquí
                  width: 100,
                  height: 100,
                  ),
                  SizedBox(width: 16),
                  Expanded(
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                        (producto['descripcion'] as String), // Conversión aquí
                        style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            IconButton(
                            icon: Icon(Icons.close), // Icono de X
                            onPressed: () {
                    // Acción al presionar el botón X
                            },
                          ),
                        ],
                      ),
                      Text('Precio: \$${producto['precio']}'), // Precio del producto
                      Text('Cantidad: ${producto['cantidad']}'), // Cantidad del producto
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
    
  }
}
