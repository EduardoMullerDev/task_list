import 'package:flutter/material.dart';
import 'dart:async'; 
import 'TelaInicial.dart'; 

class TelaDeAbertura extends StatefulWidget {
  @override
  _TelaDeAberturaState createState() => _TelaDeAberturaState();
}

class _TelaDeAberturaState extends State<TelaDeAbertura> {
  @override
  void initState() {
    super.initState();
    
    Timer(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => TelaInicial()), 
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
            Icon(Icons.checklist, size: 100, color: Colors.white), 
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
