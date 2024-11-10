import 'package:flutter/material.dart';
import 'politicaeprivacidade.dart';
import 'notificacao.dart';
import 'tela_conta.dart';
import 'telafeedback.dart';
import 'telatemas.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class TelaConfiguracao extends StatefulWidget {
  @override
  _TelaConfiguracaoState createState() => _TelaConfiguracaoState();
}

class _TelaConfiguracaoState extends State<TelaConfiguracao> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            ListTile(
              leading: Icon(Icons.account_circle, size: 30.0),
              title: Text(
                'Conta',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaConta()),
                );
              },
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.notifications, size: 30.0),
              title: Text(
                'Notificações',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaNotificacoes()),
                );
              },
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.feedback, size: 30.0),
              title: Text(
                'Feedback',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaFeedback()),
                );
              },
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.security, size: 30.0),
              title: Text(
                'Política e Privacidade',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => telapoliticaprivacidade()),
                );
              },
            ),
            SizedBox(height: 8.0),
            ListTile(
              leading: Icon(Icons.palette, size: 30.0),
              title: Text(
                'Temas',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TelaTemas()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
