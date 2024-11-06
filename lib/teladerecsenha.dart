import 'package:flutter/material.dart';
import 'teladelogin.dart'; // Importando a tela de login

class TelaRecuperacaoSenha extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Recuperar/Alterar Senha',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontFamily: 'Roboto', 
                ),
              ),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Senha Atual',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Nova Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Confirmar Nova Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              obscureText: true,
            ),
            SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                labelText: 'Código de Segurança',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Redirecionar para a tela de login após a atualização
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaDeLogin()),
                );

                // Exibir o pop-up de sucesso
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text('Sucesso'),
                    content: Text('Senha alterada com sucesso'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('OK'),
                      ),
                    ],
                  ),
                ).then((_) {
                  // Fechar o pop-up após 2 segundos
                  Future.delayed(Duration(seconds: 2), () {
                    Navigator.of(context).pop();
                  });
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 23), // Aumentado o tamanho da fonte
              ),
              child: Text('Atualizar'),
            ),
          ],
        ),
      ),
    );
  }
}
