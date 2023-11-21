import 'package:flutter/material.dart';
import '../../locator.dart';
import '../../services/navigation_service.dart';
import '../widgets/custom_buttom.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/text_widget.dart';
import '../widgets/wsixed.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 40, 42, 57),
            child: Padding(
              padding: const EdgeInsets.all(50),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        child: const Image(
                            image: AssetImage('assets/LogoIcono.png'),
                            height: 30),
                      ),
                      TextWidget(
                        text: '  Ransa',
                        textcolor: Colors.white,
                        textsize: 22,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  WSizedBox(wval: 0, hval: 0.2),
                  Row(
                    children: [
                      WSizedBox(wval: 0.05, hval: 0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          WSizedBox(wval: 0, hval: 0.02),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              TextWidget(
                                text: 'Portal de EPP',
                                textcolor: Colors.white,
                                textsize: 45,
                                fontWeight: FontWeight.bold,
                              ),
                              Container(
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                                height: 10,
                                width: 10,
                              ),
                            ],
                          ),
                          WSizedBox(wval: 0, hval: 0.03),
                          Row(
                            children: [
                              TextWidget(
                                text: '¿Olvidó su contraseña?',
                                textcolor: Colors.grey,
                                textsize: 15,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          ),
                          WSizedBox(wval: 0, hval: 0.03),
                          Container(
                            height: altura * 0.07,
                            width: ancho * 0.32,
                            child: CustomTextField(
                                borderradius: 20,
                                bordercolor: Color.fromARGB(255, 50, 54, 69),
                                widh: 0.32,
                                height: 0.05,
                                icon: Icons.person,
                                iconColor: Colors.grey,
                                hinttext: 'Usuario',
                                hintColor: Colors.grey,
                                fontsize: 15,
                                obscureText: false),
                          ),
                          WSizedBox(wval: 0, hval: 0.02),
                          Container(
                            height: altura * 0.07,
                            width: ancho * 0.32,
                            child: CustomTextField(
                                borderradius: 20,
                                bordercolor: Color.fromARGB(255, 50, 54, 69),
                                widh: 0.32,
                                height: 0.05,
                                icon: Icons.lock,
                                iconColor: Colors.grey,
                                hinttext: 'Contraseña',
                                hintColor: Colors.grey,
                                fontsize: 15,
                                obscureText: true),
                          ),
                          WSizedBox(wval: 0, hval: 0.04),
                          CustomButton(
                            buttontext: 'Ingresar',
                            width: 0.32,
                            height: 0.05,
                            bordercolor: Color.fromARGB(255, 29, 144, 244),
                            borderradius: 25,
                            fontsize: 12,
                            fontweight: FontWeight.bold,
                            fontcolor: Colors.white,
                            onPressed: () {
                              locator<NavigationService>()
                                  .navigateTo('/ghhome');
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Container(width: ancho * 0.4),
              ClipPath(
                child: Container(
                  width: ancho * 0.6,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/imagenhome.jpg'),
                    ),
                  ),
                  alignment: Alignment.centerRight,
                ),
                clipper: CustomClipPath(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double height = size.height;
    double width = size.width;

    Path path = Path();
    //LineaArriba
    //lineaverticalIzq
    path.lineTo(size.width / 3, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
