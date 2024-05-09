import 'package:flutter/material.dart';

class CaseComputerPage extends StatelessWidget {
  const CaseComputerPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Case de computador'),
      ),
      body: const Center(
        child: Text('Contenido'),
      ),
    );
  }
}