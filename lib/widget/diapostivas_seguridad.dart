import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

final List<String> images = [
  'assets/DiapositivaSeguridad_6.jpg',
  'assets/DiapositivaSeguridad_7.jpg.png',
  'assets/DiapositivaSeguridad_8.jpg',
  'assets/DiapositivaSeguridad_9.jpg',
  'assets/DiapositivaSeguridad_10.jpg',
  'assets/DiapositivaSeguridad_11.jpg.png',
  'assets/DiapositivaSeguridad_12.jpg',
  'assets/DiapositivaSeguridad_13.jpg',
  'assets/DiapositivaSeguridad_14.jpg',
  'assets/DiapositivaSeguridad_15.jpg',
  'assets/DiapositivaSeguridad_16.jpg',
  'assets/DiapositivaSeguridad_17.jpg',
  'assets/DiapositivaSeguridad_18.jpg',
  'assets/DiapositivaSeguridad_19.jpg',
  'assets/DiapositivaSeguridad_20.jpg',
  'assets/DiapositivaSeguridad_21.jpg',
  'assets/DiapositivaSeguridad_22.jpg',
  'assets/DiapositivaSeguridad_23.jpg',
  'assets/DiapositivaSeguridad_24.jpg',
  'assets/DiapositivaSeguridad_25.jpg',
];

List<Widget> generateImagesTiles() {
  return images
      .map((element) => ClipRRect(
            child: Image.asset(element, fit: BoxFit.cover),
          ))
      .toList();
}

class DiapositivasSeguridad extends StatefulWidget {
  const DiapositivasSeguridad({super.key});

  @override
  State<DiapositivasSeguridad> createState() => _DiapositivasSeguridadState();
}

class _DiapositivasSeguridadState extends State<DiapositivasSeguridad> {
  //Responsivo----------------
  bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.height >= 500;
  bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.height < 500;

  //---------------------------

  @override
  Widget build(BuildContext context) {
    final controller = CarouselController();
    void next() => controller.nextPage();
    void previuos() => controller.previousPage();

    double ancho = MediaQuery.of(context).size.width;
    double altura = MediaQuery.of(context).size.height;

    return Center(
      child: Column(
        children: [
          Container(
            height: altura * 0.7,
            child: CarouselSlider(
              carouselController: controller,
              items: generateImagesTiles(),
              options: CarouselOptions(
                  enlargeCenterPage: true, enableInfiniteScroll: false),
            ),
          ),
          if (isDesktop(context))
            Column(
              children: [
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: previuos,
                          child: Icon(Icons.arrow_back, size: altura * 0.05)),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: next,
                          child:
                              Icon(Icons.arrow_forward, size: altura * 0.05)),
                    ],
                  ),
                ),
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ancho * 0.03,
                                vertical: altura * 0.03)),
                        onPressed: () {},
                        child: Text("Ir a Evaluación"),
                      )
                    ],
                  ),
                ),
              ],
            ),
          if (isMobile(context))
            Column(
              children: [
                Container(
                  height: altura * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: previuos,
                          child: Icon(Icons.arrow_back, size: altura * 0.05)),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: ancho * 0.03,
                                vertical: altura * 0.03)),
                        onPressed: () {},
                        child: Text("Ir a Evaluación"),
                      ),
                      SizedBox(
                        width: ancho * 0.05,
                      ),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: ancho * 0.01,
                                  vertical: altura * 0.005)),
                          onPressed: next,
                          child:
                              Icon(Icons.arrow_forward, size: altura * 0.05)),
                    ],
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}
