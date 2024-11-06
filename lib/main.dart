import 'package:flutter/material.dart';
import 'teladeabertura.dart'; // Importa o arquivo da tela de abertura

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TelaDeAbertura(), // Chama a tela de abertura
    );
  }
}
