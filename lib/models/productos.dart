import 'package:cloud_firestore/cloud_firestore.dart';

class Producto {
  final String nombre;
  final double precio;
  final String descripcion;
  final String imagenUrl;

  Producto({
    required this.nombre,
    required this.precio,
    required this.descripcion,
    required this.imagenUrl,
  });

  factory Producto.fromDocument(DocumentSnapshot doc) {
    return Producto(
      nombre: doc['nombre_producto'],
      precio: doc['precio'],
      descripcion: doc['descripcion'],
      imagenUrl: doc['imagen'],
    );
  }
}
