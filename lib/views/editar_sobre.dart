import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/user_profile.dart';
import '../provider/user_profile_provider.dart';
import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../themes/app_text_styles.dart';
import '../widgets/input_text.dart';

class EditarSobre extends StatefulWidget {
  const EditarSobre({Key? key}) : super(key: key);

  @override
  State<EditarSobre> createState() => _EditarSobreState();
}

class _EditarSobreState extends State<EditarSobre> {
  ScrollController controller = ScrollController();
  final List<String> diasSemana = ["Segunda-feira","Terça-feira","Quarta-feira",
    "Quinta-feira","Sexta-feira","Sábado","Domingo"];
   final List<String> listaDeHoras = ["00:00","01:00","02:00","03:00","04:00",
     "05:00","06:00","07:00","08:00","09:00","10:00","11:00","12:00","13:00",
     "14:00","15:00","16:00","17:00","18:00","19:00","20:00","21:00","22:00",
     "23:00","24:00",];


  Widget InputText(String titulo, String descricao, double heigth, double width,
      void Function(String value) onChanged){
    return SizedBox(
      width: width,
      height: heigth,
      child: Column(
        children: [
          SizedBox(
              height: heigth*0.52,
              width: width,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(titulo, style: AppTextStyles.titleOpenSans16,),
              )
          ),
          SizedBox(
            height: heigth*0.48,
            width: width,
            child: InputTextWidget(
                initalValue: descricao,
                label: "",
                onChanged:onChanged,
                // (value){
                // descricao = value;
                // },
                keyboardType: TextInputType.text,
                backgroundColor: AppColors.white,
                borderColor: AppColors.cinzaCardMain,
                textStyle: AppTextStyles.subtitleOpenSans16),
          ),
        ],
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
      Size size = MediaQuery.of(context).size;
      UserProfile userProfile = Provider.of<UserProfileProvider>(context).userProfile;
      return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.primaryColor),
          backgroundColor: AppColors.white,
          title: Center(child: Text("Editar Sobre", style: AppTextStyles.titleOpenSans18,),),
          actions: [
            InkWell(
                onTap: (){
                  Provider.of<UserProfileProvider>(context, listen: false).updateProfile(userProfile);
                  setState(() {
                    print("salvou");
                  });
                  Navigator.pop(context);
                },
                child: Padding(
                    padding: EdgeInsets.only(right: 15.72),
                    child: Center(
                        child:Text("Salvar", style: AppTextStyles.subtitleOpenSans15Blue,)
                    )
                )),
          ],
        ),
        body: Container(
          width: size.width,
          color: AppColors.white,
          child: SingleChildScrollView(
              controller: controller,
              child: Padding(
                padding: EdgeInsets.only(left: 23.38, right: 23.38, top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.47),
                      child: Text("Horário de atendimento", style: AppTextStyles.titleOpenSans16),
                    ),
                    //lista com dias da semana
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: userProfile.horaFechamento.length,
                        itemBuilder: (context, index){
                          return Padding(
                            padding: EdgeInsets.only(bottom: 12.47),
                            child: SizedBox(
                              height: 42,
                              child: Row(
                                children: [
                                  //dia da semana
                                  Padding(
                                    padding: EdgeInsets.only(right: 12),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(4),
                                          border: Border.all(
                                            color: AppColors.buttonNavigator,
                                            width: 1.0,
                                          ),
                                        ),
                                        width: size.width*0.36,
                                        height: 40,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 8),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(diasSemana[index], style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                            )
                                        )
                                    ),
                                  ),
                                  //hora entrada
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.buttonNavigator,
                                        width: 1.0,
                                      ),
                                    ),
                                    width: size.width * 0.197,
                                    height: 40,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          DropdownButton<String>(
                                            value: userProfile.horaAbertura[index],
                                            icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor,),
                                            iconSize: 24,
                                            elevation: 16,
                                            onChanged: (newValue) {
                                              setState(() {
                                                userProfile.horaAbertura[index] = newValue as String;
                                              });
                                            },
                                            items: listaDeHoras.map((String hora) {
                                              return DropdownMenuItem<String>(
                                                value: hora,
                                                child: Text(hora, style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                  ///acento ao contrário
                                  Padding(
                                    padding: EdgeInsets.only(left: 12, right: 12),
                                    child: Text("ás", style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                  ),

                                  //horario saida
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: AppColors.buttonNavigator,
                                        width: 1.0,
                                      ),
                                    ),
                                    width: size.width * 0.197,
                                    height: 40,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Row(
                                        children: [
                                          DropdownButton<String>(
                                            value: userProfile.horaAbertura[index],
                                            icon: Icon(Icons.keyboard_arrow_down, color: AppColors.primaryColor,),
                                            iconSize: 24,
                                            elevation: 16,
                                            onChanged: (newValue) {
                                              setState(() {
                                                userProfile.horaFechamento[index] = newValue as String;
                                              });
                                            },
                                            items: listaDeHoras.map((String hora) {
                                              return DropdownMenuItem<String>(
                                                value: hora,
                                                child: Text(hora, style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                              );
                                            }).toList(),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),

                                ],
                              ),
                            ),
                          );
                        }
                    ),
                    //sábado
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.47),
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //dia da semana
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: AppColors.buttonNavigator,
                                      width: 1.0,
                                    ),
                                  ),
                                  width: size.width*0.36,
                                  height: 40,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(diasSemana[5], style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                      )
                                  )
                              ),
                            ),
                            //hora entrada
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.buttonNavigator,
                                    width: 1.0,
                                  ),
                                ),
                                width: size.width*0.36,
                                height: 40,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Fechado", style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                    ),
                    //Domingo
                    Padding(
                      padding: EdgeInsets.only(bottom: 12.47),
                      child: SizedBox(
                        height: 42,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //dia da semana
                            Padding(
                              padding: EdgeInsets.only(right: 12),
                              child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4),
                                    border: Border.all(
                                      color: AppColors.buttonNavigator,
                                      width: 1.0,
                                    ),
                                  ),
                                  width: size.width*0.36,
                                  height: 40,
                                  child: Padding(
                                      padding: EdgeInsets.only(left: 8),
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(diasSemana[6], style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                      )
                                  )
                              ),
                            ),
                            //hora entrada
                            Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                    color: AppColors.buttonNavigator,
                                    width: 1.0,
                                  ),
                                ),
                                width: size.width*0.36,
                                height: 40,
                                child: Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text("Fechado", style: AppTextStyles.subtitleOpenSans16CinzaEscuro,),
                                    )
                                )
                            ),
                          ],
                        ),
                      ),
                    ),

                    //Edifícios + botão adicionar
                    Padding(
                      padding: EdgeInsets.only(top: 34.5 , bottom: 14.97,),
                      child: SizedBox(
                        height: 29,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //label moradores
                            Text("Edifícios", style: AppTextStyles.titleOpenSans16,),
                            //botão adicionar
                            InkWell(
                              onTap: (){
                                  userProfile.edificios.add("Edifício ${userProfile.edificios.length}");
                                  userProfile.administradorEdificio.add("Administrador ${userProfile.administradorEdificio.length}");
                                  setState(() {
                                    
                                  });
                              },
                              child: Container(
                                height: 29,
                                width: size.width*0.214,
                                decoration: BoxDecoration(
                                  color: AppColors.white,
                                  borderRadius: BorderRadius.circular(48),
                                  border: Border.all(
                                    color: AppColors.primaryColor,
                                    width: 1.0,
                                  ),
                                ),
                                child: Center(
                                  child: Text("Adicionar"),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    //lista de edificios
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: userProfile.edificios.length,
                        itemBuilder: (context, index){
                          String edificio = userProfile?.edificios?[index] ?? '';
                          return Column(
                            children: [
                              Container(
                                  width: size.width-(46.76),
                                  child: SizedBox(
                                    height: 76,
                                    child: Row(
                                      children: [
                                        //imagem
                                        Padding(
                                          padding: EdgeInsets.only(right: 7.68),
                                          child: ClipOval(
                                            child: Container(
                                              // color: AppColors.primaryColor,
                                              width: 51.88,
                                              height: 51.88,
                                              child: Image.asset(
                                                AppImages.elipseMG,
                                                fit: BoxFit.contain,
                                              ),
                                            ),
                                          ),
                                        ),
                                        //informações
                                        Expanded(
                                            child:  Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                //edificio + icone
                                                Row(

                                                  children: [
                                                    Text(userProfile.edificios[index], style: AppTextStyles.titleOpenSans16,),
                                                    //Ícone
                                                    Padding(
                                                      padding: EdgeInsets.only(left: 4.68, right: 9.75),
                                                      child: Container(
                                                        // color: AppColors.buttonNavigator,
                                                          height: 16,
                                                          width:  16,
                                                          child: Image.asset(
                                                            AppImages.iconCheckBlue,
                                                            fit: BoxFit.cover,
                                                          )
                                                      ),

                                                    ),
                                                    //Icone arrow
                                                    Expanded(
                                                        child: Align(
                                                          alignment: Alignment.centerRight,
                                                          child: Icon(Icons.keyboard_arrow_down_rounded, color: AppColors.buttonNavigator,),
                                                        ))

                                                  ],
                                                ),
                                                Row(
                                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    Text("Administrador", style: AppTextStyles.subtitleOpenSans15,),
                                                    Container(
                                                        height: 40,
                                                        decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(4.0),
                                                          color: AppColors.white,
                                                          border: Border.all(
                                                            color: AppColors.buttonNavigator,
                                                            width: 1.0,
                                                          ),
                                                        ),
                                                        child: Row(
                                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                          children: [
                                                            //nome adm
                                                            Padding(
                                                              padding: EdgeInsets.only(left: 12),
                                                              child: Text(userProfile.administradorEdificio[index],style: AppTextStyles.subtitleOpenSans16Black,),
                                                            ),
                                                            //ícone edit
                                                            SizedBox(
                                                              width:40,
                                                              child: IconButton(
                                                                  color: AppColors.white,
                                                                  onPressed: (){

                                                                  },
                                                                  icon: Icon(Icons.edit, color: AppColors.buttonNavigator,size: 16)),
                                                            )
                                                          ],
                                                        )
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ))
                                      ],
                                    ),
                                  )
                              ),
                              Divider(),
                            ],
                          );

                        }
                    ),

                    InputText("Localização", userProfile.localizacao, 76.47, size.width,
                            (String value){
                          userProfile.localizacao = value;
                          setState((){});
                        }),

                    InputText("Whatsapp", userProfile.telefone, 76.47, size.width,
                            (String value){
                          userProfile.telefone = value;
                          setState((){});
                        }),
                    InputText("Email", userProfile.email, 76.47, size.width,
                            (String value){
                          userProfile.email = value;
                          setState((){});
                        }),


                  ],
                ),
              )
          ),
        ),
      );
    }
}
