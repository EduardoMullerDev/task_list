import 'package:flutter/material.dart';
import 'tela_conta.dart'; // Importe o arquivo com a tela de conta

class TelaPrincipal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Quadrado Azul Fixo na Parte Superior
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Container(
              color: Colors.blue,
              height: MediaQuery.of(context).size.height * 0.25, // Aumentando a altura do quadrado azul
            ),
          ),
          // Conteúdo da tela
          Column(
            children: [
              // AppBar sobre o quadrado azul
              AppBar(
                backgroundColor: Colors.blue, // Mudando a cor da AppBar para azul
             
                leading: IconButton(
                  icon: Icon(Icons.menu),
                  onPressed: () {
                    // Ação para abrir a tela de menu
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => TelaMenu()), // Placeholder para a tela de menu
                    );
                  },
                ),
                actions: [
                  IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      // Ação para pesquisa
                    },
                  ),
                ],
              ),
              // Aba Horizontal
              Container(
                height: 170,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                  
                  ],
                ),
              ),
              // Listas (abaixo do quadrado azul)
              Expanded(
                child: ListView(
                  children: [
                    _buildListItem('Lista 1'),
                    _buildListItem('Lista 2'),
                    _buildListItem('Lista 3'),
                  ],
                ),
              ),
              // Botão de Adicionar Tarefa
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      // Ação para adicionar tarefa
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => TelaAdicionarTarefa()), // Placeholder para a tela de adicionar tarefa
                      );
                    },
                    child: Icon(Icons.add),
                    tooltip: 'Adicionar Tarefa',
                  ),
                ),
              ),
              SizedBox(height: 10),
              // Quadrado Azul com Menus Rápidos
              Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    // Menus Rápidos
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildQuickMenuItem(context, Icons.home, 'Tela Principal'),
                        _buildQuickMenuItem(context, Icons.calendar_today, 'Calendário'),
                        _buildQuickMenuItem(context, Icons.settings, 'Configuração'),
                        _buildQuickMenuItem(context, Icons.account_circle, 'Conta'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListButton(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ElevatedButton(
        onPressed: () {
          // Ação para selecionar a lista
        },
        child: Text(title),
      ),
    );
  }

  Widget _buildListItem(String title) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(title),
        onTap: () {
          // Ação ao clicar na lista
        },
      ),
    );
  }

  Widget _buildQuickMenuItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Conta') {
          // Navegar para a tela de conta
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaConta()),
          );
        }
        // Adicione aqui outras ações para os outros ícones, se necessário
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: Colors.white, size: 30),
          SizedBox(height: 5),
          Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}

// Placeholder para a tela de menu
class TelaMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Menu')),
      body: Center(child: Text('Tela de Menu')),
    );
  }
}

// Placeholder para a tela de adicionar tarefa
class TelaAdicionarTarefa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Adicionar Tarefa')),
      body: Center(child: Text('Tela de Adicionar Tarefa')),
    );
  }
}
