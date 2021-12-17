import 'package:flutter/material.dart';

class MapsPage extends StatefulWidget {
  const MapsPage({Key? key}) : super(key: key);

  @override
  _MapsPageState createState() => _MapsPageState();
}

class _MapsPageState extends State<MapsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: const Text("MAPS"),
          centerTitle: true,
          leading: const SizedBox(),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.map,
                  size: 35,
                ))
          ],
        ),
        body: Stack(
          children: [
            Positioned(
                child: Container(
              color: Colors.red,
              height: size.height,
              width: size.width,
              child: Image.asset(
                "images/maps.jpg",
                fit: BoxFit.fill,
              ),
            )),
          ],
        ));
  }
}
