import 'dart:convert';

class UserProfile{
  String nome;
  String bio;
  String localizacao;
  String administrador;
  String telefone;
  String email;
  List<String> marcadores;
  List<String> edificios;
  List<String> horaAbertura;
  List<String> horaFechamento;
  List<String> administradorEdificio;

  UserProfile({
    required this.nome,
    required this.bio,
    required this.localizacao,
    required this.administrador,
    required this.marcadores,
    required this.edificios,
    required this.horaAbertura,
    required this.horaFechamento,
    required this.administradorEdificio,
    required this.telefone,
    required this.email,
  });


  // Função para alterar os dados do perfil
  // void alterarPerfil(String novoNome, String novoAdministrador, String novaLocalizacao, String novaBio ) {
  //   nome = novoNome;
  //   bio = novaBio;
  //   localizacao = novaLocalizacao;
  //   administrador = novoAdministrador;
  //
  // }

  // Função para adicionar um marcador
  // void adicionarMarcador(String novoMarcador) {
  //   marcadores.add(novoMarcador);
  //   marcadores.sort();
  // }
  //
  //remover marcador
  // void removerMarcador(String marcador) {
  //   marcadores.removeWhere((element) => element.compareTo(marcador)==0);
  // }
}
