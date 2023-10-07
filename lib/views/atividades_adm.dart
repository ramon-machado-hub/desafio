import 'package:flutter/material.dart';
import 'package:test_aplication/provider/user_profile_provider.dart';
import 'package:test_aplication/widgets/app_bar_widget.dart';
import 'package:provider/provider.dart';

import '../model/user_profile.dart';
import '../themes/app_colors.dart';
import '../themes/app_images.dart';
import '../themes/app_text_styles.dart';

class AtividadesAdm extends StatefulWidget {
  const AtividadesAdm({Key? key}) : super(key: key);

  @override
  State<AtividadesAdm> createState() => _AtividadesAdmState();
}

class _AtividadesAdmState extends State<AtividadesAdm> {
  ScrollController controller = ScrollController();
  bool _atividadeCheck = true;
  int _countPage =1;
  List<Widget> _listWidget = [];

  final List<String> comments =[
    "Lorem ipsum dolor sit amet consectetur. Nec scelerisque tristique dictumst sed. Sit etiam.",
    "Lorem ipsum dolor sit amet consectetur.",
    "Lorem ipsum dolor sit amet consectetur. Praesent congue magna sapien leo. Nunc varius sed volutpat amet turpis. Eros tempus.",
    "Lorem ipsum dolor sit amet consectetur."
  ];
  
  Widget _buildAtividadesWidget(Size size, UserProfile userProfile) {
    return Builder(builder: (BuildContext context) {
      return SizedBox(
        height: size.height-(255+142.7+54.55),
        width: size.width,
        child: ListView.builder(
            controller: controller,
            itemCount: 10,
            itemBuilder: (BuildContext context, int index) {
              return Padding(padding: EdgeInsets.only(top: 23.38),
                child: Container(
                  // margin: const EdgeInsets.symmetric(vertical: 12.47),
                  padding: const EdgeInsets.only(left: 12.47),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //imagem
                      SizedBox(
                        width:44,
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.37),
                            child: ClipOval(
                              child: Container(
                                width: 44.0,
                                height: 44.0,
                                child: Image.asset(
                                  AppImages.elipseCentral,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ),


                          ),
                      ),
                      //ingormações
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //cabeçalho
                          SizedBox(
                            width: size.width *0.811,
                            child: Container(
                              height: 24,
                              child: Row(
                                children: [
                                  //título + ícone
                                  SizedBox(
                                    height: 24,
                                    width: size.width*0.716,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                                      children: [
                                        //Descrição
                                        SizedBox(
                                            width: size.width*0.336,
                                            height: 24,
                                            child: FittedBox(
                                              fit: BoxFit.scaleDown,
                                              child: Text(userProfile.nome, style: AppTextStyles.titleOpenSans,),
                                            )

                                        ),
                                        //Ícone
                                        Container(
                                          // color: AppColors.buttonNavigator,
                                            height: 16,
                                            width:  16,
                                            child: Image.asset(
                                              AppImages.iconCheck,
                                              fit: BoxFit.cover,
                                            )
                                        ),
                                        //@usuario
                                        SizedBox(
                                          width:  size.width*0.287,
                                        ),
                                        SizedBox(
                                          width:  (size.width*0.715-(size.width*0.668+12)),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          //texto
                          Container(
                            constraints: BoxConstraints(maxWidth: size.width-(12.47+16.37+44)),
                            child: Text(comments[index%4], style: AppTextStyles.titleOpenSans16_400),
                          ),
                          //qtd comentários
                          SizedBox(
                            width: size.width *0.811,
                            child: Container(
                              // color: AppColors.labelBlack,
                              height: 24,
                              child: Row(
                                children: [

                                  SizedBox(
                                    width: size.width *0.811-size.width*0.111,
                                  ),
                                  SizedBox(
                                      width: size.width*0.111,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                        children: [
                                          Icon(Icons.mode_comment_outlined, color: AppColors.cinzaCardMain),
                                          Text("0", style: AppTextStyles.subtitleOpenSans17,)
                                        ],
                                      )

                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              );
            }
        ),
      );
    });
  }

  Widget _buildSobreWidget(Size size, UserProfile userProfile) {
    final List<String> diasSemana = ["Segunda","Terça","Quarta",
      "Quinta","Sexta","Sábado","Domingo"];
    return Builder(builder: (BuildContext context) {
      return Container(
        color: AppColors.white,
        height: size.height-(255+142.7+54.55),
        width: size.width,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 24, right: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //botão Editar seção sobre
                Padding(
                  padding: const EdgeInsets.only(top: 23.38, bottom: 32),
                  child: InkWell(
                    onTap: (){
                        Navigator.pushNamed(context, "/editar-sobre");
                    },
                    child: Container(
                      height: 38,
                      width: size.width*0.46,
                      decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.circular(48),
                        border: Border.all(
                          color: AppColors.primaryColor,
                          width: 1.0,
                        ),
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text("Editar seção sobre", style: AppTextStyles.titleOpenSans20,),
                      ),
                    ),
                  ),),
                Text("Horário de atendimento", style: AppTextStyles.titleOpenSans16),
                Container(
                  // color: AppColors.azulMain2,
                  height: 219,
                  child:Column(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index){
                          return Container(
                            height: (219/7),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(diasSemana[index], style: AppTextStyles.subtitleOpenSans16,),
                                Expanded(
                                    child: Divider(
                                      thickness: 1 ,
                                      color: AppColors.cinzaMain,
                                    )
                                ),
                                SizedBox(
                                  width: 103,
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Expanded(child: Text(userProfile.horaAbertura[index],style: AppTextStyles.subtitleOpenSans16,),),
                                      Text("às",style: AppTextStyles.subtitleOpenSans16,),
                                      Expanded(child: Text(userProfile.horaFechamento[index],style: AppTextStyles.subtitleOpenSans16,),),
                                    ],
                                  ),
                                )

                              ],
                            ),
                          );

                        },),
                      Container(
                        height: (219/7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Sábado ", style: AppTextStyles.subtitleOpenSans16,),
                            Expanded(
                                child: Divider(
                                  thickness: 1 ,
                                  color: AppColors.cinzaMain,
                                )
                            ),
                            Text(" Fechado", style: AppTextStyles.subtitleOpenSans16,),
                          ],
                        ),
                      ),
                      Container(
                        height: (219/7),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text("Domingo ", style: AppTextStyles.subtitleOpenSans16,),
                            Expanded(
                                child: Divider(
                                  thickness: 1 ,
                                  color: AppColors.cinzaMain,
                                )
                            ),
                            Text(" Fechado", style: AppTextStyles.subtitleOpenSans16,),
                          ],
                        ),
                      )
                    ],

                  ),
                ),
                //label Edifícios
                Padding(padding: EdgeInsets.only(top: 32, bottom: 24),
                  child: Text("Edifícios", style: AppTextStyles.titleOpenSans16),
                ),
                //lista de edificios
                ListView.builder(
                    shrinkWrap: true,
                    itemCount: userProfile.edificios.length,
                    itemBuilder: (context, index){
                      String edificio = userProfile?.edificios?[index] ?? '';
                      return Padding(
                        padding: EdgeInsets.only(bottom: 24),
                        child:  SizedBox(
                          height: 51.88,
                          child: Row(
                            children: [
                              //imagem
                              Padding(
                                padding: EdgeInsets.only(right: 7.68),
                                child: ClipOval(
                                  child: Container(
                                    // color: AppColors.primaryColor,
                                    width: 44,
                                    height: 44,
                                    child: Image.asset(
                                      AppImages.listaEdificios[index%3],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                  child:  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
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
                                          //Administrador
                                          Text(userProfile.administradorEdificio[index], style: AppTextStyles.subtitleOpenSans12,),

                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(top: 4.68),
                                        child: Text("Edificio da cidade Administrativa de MG", style: AppTextStyles.subtitleOpenSans15,)
                                      )
                                    ],
                                  ))
                            ],
                          ),
                        ),
                      );

                    }
                ),
                //label Localização
                Padding(padding: EdgeInsets.only(top: 32, bottom: 24),
                  child: Text("Localização", style: AppTextStyles.titleOpenSans16),
                ),
                //icone + endereço
                Row(
                  children:[
                    Icon(Icons.location_on_outlined, color: AppColors.primaryColor,),
                    Text("São Jorge 2ª Seção, Belo Horizonte - MG, 30451-102", style: AppTextStyles.subtitleOpenSans14cinza,)
                  ]
                ),

                //imagem Mapa
                Padding(
                    padding: const EdgeInsets.only(top:23, bottom: 32),
                  child: SizedBox(
                      height: 142,
                      width:  size.width-48,
                      child: Image.asset(
                        AppImages.mapa,
                        fit: BoxFit.cover,
                      )

                  ),
                ),
                //Contato
                Padding(padding: EdgeInsets.only( bottom: 24),
                  child: Text("Contato", style: AppTextStyles.titleOpenSans16),
                ),

                //informações contato
                Padding(
                    padding: EdgeInsets.only(bottom: 32),
                    child: SizedBox(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            //telefone
                            Padding(
                              padding: EdgeInsets.only(bottom: 12),
                              child: Row(
                                children: [
                                  //Ícone
                                  Container(
                                      height: 20,
                                      width:  20,
                                      child: Image.asset(
                                        AppImages.iconZap,
                                        fit: BoxFit.fill,
                                      )
                                  ),
                                  //fone
                                  Padding(
                                    padding: EdgeInsets.only(left: 8),
                                    child: Text(userProfile.telefone, style: AppTextStyles.subtitleOpenSans14cinza),
                                  )
                                ],
                              ),
                            ),

                            //email
                            Row(
                              children: [
                                //Ícone
                                Container(
                                    height: 20,
                                    width:  20,
                                    child: Center(
                                        child: Icon(Icons.email_outlined, color: AppColors.primaryColor,)
                                    )
                                ),
                                //email
                                Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(userProfile.email, style: AppTextStyles.subtitleOpenSans14cinza),
                                )
                              ],
                            )
                          ]
                      )
                  ),
                )
              ],
            ),
          )
        ),
      );
    });
  }

  Widget _buildAvisosWidget(Size size) {
    return Builder(builder: (BuildContext context) {
      return Container(
        height: size.height-(255+142.7+54.55),
        width: size.width,
        color: AppColors.white,
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    UserProfile userProfile = Provider.of<UserProfileProvider>(context).userProfile;


    print("cont = ${_listWidget.length}");
    return Scaffold(
       appBar: PreferredSize(
         preferredSize:  const Size.fromHeight(255),
         child:  AppBarWidget(atividade: _atividadeCheck),
       ),
        body: Container(
          child: SingleChildScrollView(

            child: Column(
              children: [
                //Descrições do perfil
                Container(
                    height: 101,
                    width: size.width,
                    color: AppColors.white,
                    child: Padding(
                      padding: EdgeInsets.only(left: 24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          //título + ícone
                          SizedBox(
                            height: 34,
                            width: size.width*0.716,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                SizedBox(
                                    width: size.width*0.473,
                                    height: 34,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      // child: Text("Cidade ADM de MG", style: AppTextStyles.titleOpenSans,),
                                      child: Text(userProfile.nome, style: AppTextStyles.titleOpenSans,),
                                    )

                                ),
                                SizedBox(
                                    height: 15.59,
                                    width:  size.width*0.035,
                                    child: Image.asset(
                                      AppImages.iconCheck,
                                      fit: BoxFit.cover,
                                    )
                                ),
                                SizedBox(
                                  width:  size.width*0.188,
                                )
                              ],
                            ),
                          ),
                          //Perfil
                          SizedBox(
                              height: 23,
                              width: size.width*0.719,
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                // child: Text("Perfil Oficina da Cidade Administrativa de MG", style: AppTextStyles.subtitleOpenSans15),
                                child: Text(userProfile.bio, style: AppTextStyles.subtitleOpenSans15),
                              )
                          ),
                          //localização + data entrada
                          SizedBox(
                            width: size.width*0.638,
                            height: 19,
                            child: Row(
                              children: [
                                SizedBox(
                                  // color: AppColors.azulMain2,
                                    height: 15.57,
                                    width: size.width*0.03,
                                    child: FittedBox(
                                      fit: BoxFit.scaleDown,
                                      child: Icon(Icons.location_on_outlined,
                                        color: AppColors.cinzaMain,
                                      ),
                                    )
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: size.width*0.017, right: size.width*0.035),
                                  child: SizedBox(
                                    // color: AppColors.buttonNavigator,
                                      height: 19,
                                      width: size.width*0.281,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text(userProfile.localizacao, style: AppTextStyles.subtitleOpenSans12,),
                                      )
                                  ),),
                                //calendário
                                SizedBox(
                                    height: 14.42,
                                    width: size.width*0.032,
                                    child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Image.asset(
                                          AppImages.iconCalendar,
                                          fit: BoxFit.cover,

                                        )
                                    )
                                ),
                                //data entrada
                                Padding(padding: EdgeInsets.only(left: size.width*0.017),
                                  child: SizedBox(
                                      height: 19,
                                      width: size.width*0.225,
                                      child: FittedBox(
                                        fit: BoxFit.contain,
                                        child: Text("Entrou em Jan/2023 ", style: AppTextStyles.subtitleOpenSans12,),
                                      )
                                  ),)
                              ],
                            ),

                          )
                        ],
                      ),
                    )
                ),

                //Atividades, Sobre, Avisos e Comunicados
                Container(
                  height: 41.7,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border(
                        bottom: BorderSide(
                          color: AppColors.primaryColor,
                          width: 2.0,
                        ),

                      )
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 24, right: 24),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //Atividades
                        SizedBox(
                          width: size.width*0.1836,
                          height: 39.7,
                          child: InkWell(
                              onTap: (){
                                if (_countPage!=1){
                                  _countPage = 1;
                                  _atividadeCheck = true;
                                  setState(() {
                                  });
                                }
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                child: Text("Atividades",
                                  style: (_countPage==1)?
                                  AppTextStyles.subtitleOpenSans15Blue
                                      :
                                  AppTextStyles.subtitleOpenSans15Blue2,),)
                          ),
                        ),
                        //Sobre
                        SizedBox(
                          width: size.width*0.1,
                          height: 39.7,
                          child: InkWell(
                              onTap: (){
                                if (_countPage!=2){
                                  _countPage = 2;
                                  _atividadeCheck = false;
                                  setState(() {
                                  });
                                }
                                print(_countPage);
                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                child: Text("Sobre",
                                  style: (_countPage==2)?
                                  AppTextStyles.subtitleOpenSans15Blue
                                      :
                                  AppTextStyles.subtitleOpenSans15Blue2,),)
                          ),
                        ),
                        //Avisos
                        SizedBox(
                          width: size.width*0.38,
                          height: 39.7,
                          child: InkWell(
                              onTap: (){
                                if (_countPage!=3){
                                  _countPage = 3;
                                  _atividadeCheck = false;
                                  setState(() {
                                  });
                                }
                                print(_countPage);

                              },
                              child: FittedBox(
                                fit: BoxFit.contain,
                                alignment: Alignment.center,
                                child: Text("Avisos e Comunicados",
                                  style: (_countPage==3)?
                                    AppTextStyles.subtitleOpenSans15Blue
                                      :
                                    AppTextStyles.subtitleOpenSans15Blue2
                                ,),)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                //escolhe qual pagina exibir
                _getPageWidget(size, userProfile)
              ],
            ),
          )
        ),
        //barra inferior
        bottomNavigationBar: SizedBox(
            height: 54.55,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                //icone 1
                InkWell(
                  onTap: (){},
                  child: Icon(Icons.location_on_rounded, color: AppColors.cinzaMain,),
                ),

                //icone 2
                InkWell(
                    onTap: (){},
                    child: Icon(Icons.search, color: AppColors.cinzaMain,),
                ),

                //icone 3
                InkWell(
                    onTap: (){},
                    child: Icon(Icons.notifications_none_rounded, color: AppColors.cinzaMain,),
                ),

                //icone 4
                InkWell(
                    onTap: (){},
                    child: Icon(Icons.email_outlined, color: AppColors.cinzaMain,),
                ),
              ],
            )
        ),
    );
    
  }
  Widget _getPageWidget(Size size, UserProfile userProfile) {
    switch (_countPage) {
      case 1:
        return _buildAtividadesWidget(size, userProfile);
      case 2:
        return _buildSobreWidget(size, userProfile);
      case 3:
        return _buildAvisosWidget(size);
      default:
        return Container();
    }
  }

}
