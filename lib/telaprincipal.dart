import 'package:flutter/material.dart';
import 'TelaAdicionarTarefa.dart';
import 'configuracao.dart';
import 'tela_conta.dart';
import 'calendario.dart'; 
import 'package:provider/provider.dart';
import 'theme_provider.dart'; 
import 'tarefa.dart'; 

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  List<Tarefa> tarefas = [];
  List<Tarefa> tarefasFiltradas = [];
  bool isSearching = false;
  TextEditingController searchController = TextEditingController();

  void _adicionarTarefa(Tarefa tarefa) {
    setState(() {
      tarefas.add(tarefa);
      tarefasFiltradas = List.from(tarefas); // Atualiza a lista filtrada
    });
  }

  void _atualizarTarefa(Tarefa tarefaAtualizada) {
    setState(() {
      int index = tarefas.indexWhere((t) => t.nome == tarefaAtualizada.nome);
      if (index != -1) {
        tarefas[index] = tarefaAtualizada;
        tarefasFiltradas = List.from(tarefas); // Atualiza a lista filtrada
      }
    });
  }

  void _excluirTarefa(String id) {
    setState(() {
      tarefas.removeWhere((t) => t.id == id);
      tarefasFiltradas = List.from(tarefas); // Atualiza a lista filtrada
    });
  }

  void _navigateToAdicionarTarefa() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaAdicionarTarefa(
          onTarefaSalva: _adicionarTarefa,
          onTarefaExcluida: _excluirTarefa, 
        ),
      ),
    );
  }

  void _navigateToEditarTarefa(Tarefa tarefa) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => TelaAdicionarTarefa(
          tarefa: tarefa,
          onTarefaSalva: _atualizarTarefa,
          onTarefaExcluida: _excluirTarefa, 
        ),
      ),
    );
  }

  void _searchTarefa(String query) {
    if (query.isEmpty) {
      setState(() {
        tarefasFiltradas = List.from(tarefas);
      });
    } else {
      setState(() {
        tarefasFiltradas = tarefas.where((t) => t.nome.toLowerCase().contains(query.toLowerCase())).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.orange : Colors.blue,
        title: Text('Tarefas'), 
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              setState(() {
                isSearching = !isSearching;
                if (!isSearching) {
                  searchController.clear();
                  tarefasFiltradas = List.from(tarefas);
                }
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (isSearching)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: searchController,
                onChanged: _searchTarefa,
                decoration: InputDecoration(
                  hintText: 'Pesquisar tarefa...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  setState(() {
                    isSearching = false;
                    searchController.clear();
                  });
                },
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: tarefasFiltradas.length,
              itemBuilder: (context, index) {
                final tarefa = tarefasFiltradas[index];
                return ListTile(
                  title: Text(tarefa.nome),
                  subtitle: Text('${tarefa.data} - ${tarefa.hora}'),
                  trailing: tarefa.notificacaoAtivada
                      ? Icon(Icons.notifications_active)
                      : Icon(Icons.notifications_off),
                  onTap: () {
                    _navigateToEditarTarefa(tarefa);
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _navigateToAdicionarTarefa();
        },
        child: Icon(Icons.add),
        tooltip: 'Adicionar Tarefa',
      ),
      bottomNavigationBar: Container(
        color: themeProvider.isDarkMode ? Colors.orange : Colors.blue,
        padding: EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
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
    );
  }

  Widget _buildQuickMenuItem(BuildContext context, IconData icon, String title) {
    return GestureDetector(
      onTap: () {
        if (title == 'Conta') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaConta()),
          );
        } else if (title == 'Configuração') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaConfiguracao()),
          );
        } else if (title == 'Calendário') {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => TelaCalendario()),
          );
        }
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


  

