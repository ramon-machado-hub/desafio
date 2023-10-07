import 'package:flutter/material.dart';
import 'package:test_aplication/themes/app_colors.dart';
import 'package:test_aplication/themes/app_text_styles.dart';
import 'package:provider/provider.dart';
import 'package:test_aplication/widgets/input_text.dart';
import '../model/user_profile.dart';
import '../provider/user_profile_provider.dart';
import '../themes/app_images.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({Key? key}) : super(key: key);

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  ScrollController controller = ScrollController();


  Widget InputText(String titulo, String descricao, double heigth, double width, void Function(String value) onChanged){
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
        title: Center(child: Text("Editar Perfil", style: AppTextStyles.titleOpenSans18,),),
        actions: [
          InkWell(
              onTap: (){

                Provider.of<UserProfileProvider>(context, listen: false).updateProfile(userProfile);
                setState(() {
                  print("salvou");
                });
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
        color: AppColors.white,
        child: SingleChildScrollView(
          controller: controller,
          child: Padding(
            padding: EdgeInsets.only(left: 23.38, right: 23.38, top: 32),
            child: Column(
              children: [
                //imagem do perfil
                Container(
                  height: 136,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Imagem do perfil", style: AppTextStyles.titleOpenSans16),
                      //imagem
                      Padding(
                          padding: EdgeInsets.only(top: 12),
                          child: Center(
                            child: SizedBox(
                                width:100,
                                height: 100,
                                child: Stack(
                                  children: [
                                    //imagem
                                    Positioned(
                                      top:0,
                                      left: 0,
                                      child: ClipOval(
                                        child: Container(
                                          // color: AppColors.primaryColor,
                                          width: 100.0,
                                          height: 100.0,
                                          child: Image.asset(
                                            AppImages.elipseMG,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),),
                                    //camera
                                    Positioned(
                                        top:34,
                                        left: 34,
                                        child: SizedBox(
                                          width: 32,
                                          height: 32,
                                          child: Center(
                                            child: Icon(Icons.photo_camera, size: 32, color: AppColors.white, ),
                                          ),
                                        ))
                                  ],
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
                InputText("Nome", userProfile.nome, 76.47, size.width,
                        (String value){
                          userProfile.nome = value;
                          setState((){});
                        }),
                InputText("Bio", userProfile.bio, 76.47, size.width,
                        (String value){
                          userProfile.bio = value;
                          setState((){});
                        }),
                InputText("Localização", userProfile.localizacao, 76.47, size.width,
                        (String value){
                          userProfile.localizacao = value;
                          setState((){});
                        }),
                InputText("Administrador geral", userProfile.administrador, 76.47, size.width,
                        (String value){
                          userProfile.administrador = value;
                          setState((){});
                        }),
                SizedBox(
                    width: size.width,
                    child: Column(
                      children: [
                        //Moradores + botão adicionar
                        Padding(
                          padding: EdgeInsets.only(top: 34.5 , bottom: 14.97,),
                          child: SizedBox(
                            height: 29,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //label moradores
                                Text("Moradores", style: AppTextStyles.titleOpenSans16,),
                                //botão adicionar
                                InkWell(
                                  onTap: (){
                                    Provider.of<UserProfileProvider>(context, listen: false)
                                        .addMorador("morador ${userProfile.marcadores.length}");
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
                        //lista de moradores
                        ListView.builder(
                            shrinkWrap: true,

                            itemCount: userProfile.marcadores.length,
                            itemBuilder: (context, index){
                              String marcador = userProfile?.marcadores?[index] ?? '';

                              return Padding(
                                padding: const EdgeInsets.only(bottom: 14.97),
                                child: Container(
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(1.0),
                                    color: AppColors.white,
                                    border: Border.all(
                                      color: AppColors.primaryColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(marcador,style: AppTextStyles.subtitleOpenSans16Black,),
                                      IconButton(
                                          color: AppColors.white,
                                          onPressed: (){
                                            Provider.of<UserProfileProvider>(context, listen: false)
                                                .removeMoradores(marcador);
                                            setState(() {
                                              
                                            });
                                          },

                                          icon: Icon(Icons.cancel, color: AppColors.red,size: 16))
                                    ],
                                  )
                                ),
                              );

                            }
                        )
                      ],
                    )
                ),

              ],
            ),
          )
        ),
      ),
    );
  }
}
