import 'package:flutter/material.dart';
import 'package:test_aplication/themes/app_colors.dart';
import 'package:test_aplication/themes/app_images.dart';
import 'package:test_aplication/themes/app_text_styles.dart';

class AppBarWidget extends StatefulWidget {
  final bool atividade;
  const AppBarWidget({Key? key, required this.atividade}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: 255,
        width: size.width,
        color: AppColors.white,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Image.asset(
                AppImages.backGroundAppBar,
                fit: BoxFit.fill,
              ),
            ),
            (widget.atividade)?
            Positioned(
              bottom: 14,
              right: 16,
              child: InkWell(
                onTap: (){
                  Navigator.pushNamed(context, "/editar-perfil");
                },
                child: Container(
                    width: size.width*0.323,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(48),
                      border: Border.all(

                        color: AppColors.primaryColor, // Cor da borda
                        width: 1,          // Largura da borda
                      ),
                    ),
                    child: Center(
                      child: Text("Editar perfil", style: AppTextStyles.titleOpenSans20,),
                    )
                ),
              )
            )
                :
            Center()
          ],
        ),
    );
  }
}
