import 'package:carousel_pro_nullsafety/carousel_pro_nullsafety.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController pageController = PageController(initialPage: 0);

  // @override
  // void initState() {
  //   super.initState();
  // }

  Widget imageCarousel = Carousel(
    images: [
      Image.asset("images/j1.jpg"),
      Image.asset(
        "images/j3.jpg",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "images/j2.jpg",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "images/j4.jpg",
        fit: BoxFit.cover,
      ),
      Image.asset(
        "images/j5.jpeg",
        fit: BoxFit.cover,
      ),
      // Image.asset("images/ma5.jpg"),
    ],

    dotSize: 8.0,
    dotColor: Colors.red, // la couleur du buttom qui defille
    indicatorBgPadding: 25.0, // la taille de la place qui defille
    autoplay: true, //pour le defile des images
    animationCurve:
        Curves.fastOutSlowIn, // la maniere dont ils defileront fastOutSlowIn
    animationDuration: const Duration(milliseconds: 1000), // la vitesse
    dotBgColor: Colors.transparent, // pour que la barre soit transparent
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            top: size.height / 2.5,
            child: SizedBox(
                height: size.height / 2,
                width: size.width,
                child: Image.asset(
                  "images/bacground.png",
                  fit: BoxFit.contain,
                ))),
        Positioned(
            top: -10,
            child: SizedBox(
              height: size.height / 2.5,
              width: size.width,
              child: imageCarousel,
            )),
      ],
    ));
  }
}
