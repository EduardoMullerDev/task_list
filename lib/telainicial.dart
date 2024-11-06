import 'package:flutter/material.dart';
import 'teladelogin.dart';
class TelaInicial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue, // Cor de fundo
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Ícone ou logo do aplicativo
            Icon(
              Icons.checklist, // Substitua pelo seu ícone ou logo
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'TO DO LIST',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'APP',
              style: TextStyle(
                fontSize: 24,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 400), // Espaço entre o texto e o botão
            ElevatedButton(
              onPressed: () {
                // Navega para a tela de login
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaDeLogin()), // Substitua pela sua tela de login
                );
              },
              child: Text('INICIAR'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.blue, backgroundColor: Colors.white, // Cor do texto do botão
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Bordas arredondadas
                ),
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15), // Tamanho do botão
              ),
            ),
          ],
        ),
      ),
    );
  }
}

