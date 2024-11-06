import 'package:flutter/material.dart';

class TelaConta extends StatefulWidget {
  @override
  _TelaContaState createState() => _TelaContaState();
}

class _TelaContaState extends State<TelaConta> {
  final _emailController = TextEditingController();
  final _senhaController = TextEditingController();
  final _confirmaSenhaController = TextEditingController();
  final _telefoneController = TextEditingController();
  final _dataNascimentoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Conta'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 50),
            Center(
              child: Text(
                'Atualizar Dados',
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
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _senhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _confirmaSenhaController,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Confirmar Senha',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _telefoneController,
              decoration: InputDecoration(
                labelText: 'Telefone',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 30),
            TextField(
              controller: _dataNascimentoController,
              decoration: InputDecoration(
                labelText: 'Data de Nascimento',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                // Lógica para atualizar os dados da conta
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Atualizar Dados'),
            ),
          ],
        ),
      ),
    );
  }
}
