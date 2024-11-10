class Tarefa {
  String id; 
  String nome;
  String data;
  String hora;
  bool notificacaoAtivada;

  Tarefa({
    required this.id, 
    required this.nome,
    required this.data,
    required this.hora,
    required this.notificacaoAtivada,
  });
}
