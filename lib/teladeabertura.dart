import 'package:flutter/material.dart';
import 'dart:async'; // Importa o pacote para usar Timer
import 'TelaInicial.dart'; // Importa a tela inicial


class TelaDeAbertura extends StatefulWidget {
  @override
  _TelaDeAberturaState createState() => _TelaDeAberturaState();
}

class _TelaDeAberturaState extends State<TelaDeAbertura> {
  @override
  void initState() {
    super.initState();
    // Inicia o Timer ao carregar a tela
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaInicial()), // Navega para a tela inicial
      );
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.checklist, size: 100, color: Colors.white), // Use seu ícone aqui
            SizedBox(height: 20),
            Text(
              'TO DO LIST',
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              'APP',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
