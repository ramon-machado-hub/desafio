import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/provider/user_profile_provider.dart';
import 'package:test_aplication/themes/app_colors.dart';
import 'package:test_aplication/views/atividades_adm.dart';
import 'package:test_aplication/views/editar_perfil.dart';
import 'package:test_aplication/views/editar_sobre.dart';
import 'package:test_aplication/views/sobre_adm.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProfileProvider(),
      child:MaterialApp(
          title: 'Desafio',
          theme: ThemeData(
            primaryColor: AppColors.primaryColor,
            primarySwatch: Colors.deepOrange,
          ),
          initialRoute: "/atividades_adm",
          routes: {
            "/atividades_adm": (context) => const AtividadesAdm(),
            "/sobre-adm": (context) => const SobreAdm(),
            "/editar-sobre": (context) => const EditarSobre(),
            "/editar-perfil": (context) => const EditarPerfil(),
          }
      )
    );
  }
}
