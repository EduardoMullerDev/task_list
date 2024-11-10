import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 

class telapoliticaprivacidade extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Política de Privacidade'),
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue, 
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.0),
              Text(
                'Política de Privacidade',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16.0),
              Text(
                'Nesta política, explicamos como coletamos, usamos, compartilhamos e protegemos suas informações pessoais. Ao usar nossos serviços, você concorda com esta política.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Coleta de Informações',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Coletamos informações que você nos fornece diretamente, como seu nome, endereço de e-mail e outras informações de contato. Também coletamos informações sobre como você usa nossos serviços, como seu histórico de navegação e preferências.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Uso de Informações',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Usamos suas informações para fornecer e melhorar nossos serviços, personalizar sua experiência, enviar atualizações e comunicações relevantes, e cumprir nossas obrigações legais.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Compartilhamento de Informações',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Podemos compartilhar suas informações com parceiros de confiança que nos ajudam a operar nossos serviços. Nunca vendemos suas informações pessoais a terceiros.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Proteção de Informações',
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Implementamos medidas de segurança para proteger suas informações pessoais contra acesso não autorizado, uso indevido, divulgação e destruição. Revisamos regularmente nossas práticas de segurança para garantir a proteção de seus dados.',
                style: TextStyle(fontSize: 16.0),
              ),
              SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
