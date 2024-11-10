import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class TelaNotificacoes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Notificações'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Não há notificações disponíveis',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
    );
  }
}
