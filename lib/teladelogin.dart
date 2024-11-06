import 'package:flutter/material.dart';
import 'teladerecsenha.dart';
import 'teladeregistro.dart';
import 'telaprincipal.dart';

class TelaDeLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Conectar-se',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            SizedBox(height: 40),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {
                  // Redirecionar para a tela de recuperação de senha
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => TelaRecuperacaoSenha()),
                  );
                },
                child: Text(
                  'Esqueceu sua senha?',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => TelaPrincipal()),
                );
              },
              child: Text('Entrar'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
              ),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Redirecionar para a tela de registro
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => TelaRegistro()),
                );
              },
              child: Text('Não possui uma conta? Registre-se.'),
            ),
          ],
        ),
      ),
    );
  }
  
  teladeregistro() {}
}

