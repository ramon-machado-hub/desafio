
import 'package:flutter/material.dart';

import '../model/user_profile.dart';

class UserProfileProvider  with ChangeNotifier{
  late UserProfile _userProfile;

  UserProfile get userProfile => _userProfile;

  UserProfileProvider() {
    // Inicializa os valores
    _userProfile = UserProfile(
      nome: "Cidade ADM de MG",
      bio: "Perfil Oficial da Cidade Administrativa de MG",
      localizacao: "Cidade administrativa",
      administrador: "@paulo.oliveira32",
      marcadores: ["@oliverpereiraa", "@21joaobotelho"],
      administradorEdificio: ["@edificiosul","@edificionorte", "@edificiocentral"],
      edificios: ["Edifício Sul", "Edifício Norte", "Edificio Central"],
      horaAbertura: ["09:00","09:00","09:00","09:00","09:00"],
      horaFechamento: ["17:00","17:00","17:00","17:00","17:00",],
      telefone: "+55 15 91234-5678",
      email: "edificiosul@governomg.com.br"
    );
  }

  void updateProfile(UserProfile newProfile) {
    print(newProfile.nome);
    _userProfile = newProfile;
    notifyListeners();
  }

  void addMorador(String morador) {
    _userProfile.marcadores.add(morador);
    notifyListeners();
  }

  void removeMoradores(String morador) {
    print(morador);
    print(_userProfile.marcadores.length);

    _userProfile.marcadores.removeWhere((element) => element.compareTo(morador)==0);
    print(_userProfile.marcadores.length);

    print("Excluir $morador");
    notifyListeners();
  }

}