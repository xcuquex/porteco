import 'package:flutter/material.dart';

class MotherBoardPage extends StatelessWidget {
  const MotherBoardPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Placas madres'),
      ),
      body: const Center(
        child: const Text('Contenido'),
      ),
    );
  }
}