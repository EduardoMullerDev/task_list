import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; 
import 'tarefa.dart';
import 'theme_provider.dart';

class TelaAdicionarTarefa extends StatefulWidget {
  final Tarefa? tarefa;
  final void Function(Tarefa) onTarefaSalva;
  final void Function(String) onTarefaExcluida; 

  TelaAdicionarTarefa({
    this.tarefa,
    required this.onTarefaSalva,
    required this.onTarefaExcluida, 
  });

  @override
  _TelaAdicionarTarefaState createState() => _TelaAdicionarTarefaState();
}

class _TelaAdicionarTarefaState extends State<TelaAdicionarTarefa> {
  final _nomeController = TextEditingController();
  final _dataController = TextEditingController();
  final _horaController = TextEditingController();
  bool _notificacaoAtivada = false;

  @override
  void initState() {
    super.initState();
    if (widget.tarefa != null) {
      _nomeController.text = widget.tarefa!.nome;
      _dataController.text = widget.tarefa!.data;
      _horaController.text = widget.tarefa!.hora;
      _notificacaoAtivada = widget.tarefa!.notificacaoAtivada;
    } else {
      
      _dataController.text = DateFormat('dd/MM/yyyy').format(DateTime.now());
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _dataController.dispose();
    _horaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: themeProvider.isDarkMode ? Colors.grey[800] : Colors.blue,
        title: Text(widget.tarefa == null ? 'Nova Tarefa' : 'Editar Tarefa'),
        actions: [
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: _cancelarTarefa,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: 30),
              Center(
                child: Text(
                  widget.tarefa == null ? 'Nova Tarefa' : 'Editar Tarefa',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: themeProvider.isDarkMode ? Colors.white : Colors.blue,
                    fontFamily: 'Roboto',
                  ),
                ),
              ),
              SizedBox(height: 30),
              TextField(
                controller: _nomeController,
                decoration: InputDecoration(
                  labelText: 'Nome da Tarefa',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dataController,
                      readOnly: true, 
                      decoration: InputDecoration(
                        labelText: 'Data',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.calendar_today),
                          onPressed: _selecionarData,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _horaController,
                      readOnly: true, 
                      decoration: InputDecoration(
                        labelText: 'Hora',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        suffixIcon: IconButton(
                          icon: Icon(Icons.access_time),
                          onPressed: _selecionarHora,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Checkbox(
                    value: _notificacaoAtivada,
                    onChanged: (value) {
                      setState(() {
                        _notificacaoAtivada = value!;
                      });
                    },
                  ),
                  Text(
                    'Ativar notificação',
                    style: TextStyle(
                      color: themeProvider.isDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _cancelarTarefa,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text('Cancelar'),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _salvarTarefa,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: themeProvider.isDarkMode ? Colors.grey[800] : Colors.blue,
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: 15),
                        textStyle: TextStyle(fontSize: 18),
                      ),
                      child: Text(widget.tarefa == null ? 'Salvar' : 'Atualizar'),
                    ),
                  ),
                ],
              ),
              
              if (widget.tarefa != null) ...[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _excluirTarefa,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    textStyle: TextStyle(fontSize: 18),
                  ),
                  child: Text('Excluir Tarefa'),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }

  void _selecionarData() async {
    DateTime? dataSelecionada = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (dataSelecionada != null) {
      
      String dataFormatada = DateFormat('dd/MM/yyyy').format(dataSelecionada);
      _dataController.text = dataFormatada; 
    }
  }

  void _selecionarHora() async {
    TimeOfDay? horaSelecionada = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (horaSelecionada != null) {
      
      String horaFormatada = horaSelecionada.format(context);
      _horaController.text = horaFormatada; 
    }
  }

  void _salvarTarefa() {
    String nome = _nomeController.text;
    String data = _dataController.text;
    String hora = _horaController.text;

    String? id;
    if (widget.tarefa != null) {
      id = widget.tarefa!.id;
    } else {
      id = DateTime.now().millisecondsSinceEpoch.toString();
    }

    Tarefa tarefa = Tarefa(
      id: id,
      nome: nome,
      data: data,
      hora: hora,
      notificacaoAtivada: _notificacaoAtivada,
    );

    widget.onTarefaSalva(tarefa);
    Navigator.of(context).pop();
  }

  void _excluirTarefa() {
    if (widget.tarefa != null) {
      widget.onTarefaExcluida(widget.tarefa!.id); 
    }
    Navigator.of(context).pop();
  }

  void _cancelarTarefa() {
    Navigator.of(context).pop();
  }
}
