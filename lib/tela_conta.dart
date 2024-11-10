import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart';

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

  
  String? email;
  String? telefone;
  String? dataNascimento;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
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
                  color: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
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
              
                setState(() {
                  email = _emailController.text;
                  telefone = _telefoneController.text;
                  dataNascimento = _dataNascimentoController.text;
                });

               
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Sucesso'),
                      content: Text('Dados atualizados com sucesso!'),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); 
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(vertical: 15),
                textStyle: TextStyle(fontSize: 18),
              ),
              child: Text('Atualizar Dados'),
            ),
            SizedBox(height: 5),
            
            if (email != null || telefone != null || dataNascimento != null) ...[
              Divider(),
              Text('Dados Atualizados:', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text('Email: ${email ?? 'Não informado'}'),
              Text('Telefone: ${telefone ?? 'Não informado'}'),
              Text('Data de Nascimento: ${dataNascimento ?? 'Não informado'}'),
            ],
          ],
        ),
      ),
    );
  }
}
