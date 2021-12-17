import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jufe_thesis/UI/pages/MainPages/Moment/utils.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

class AddImage extends StatefulWidget {
  Image image;
  AddImage(this.image, {Key? key}) : super(key: key);

  @override
  _AddImageState createState() => _AddImageState();
}

class _AddImageState extends State<AddImage> {
  Image? image;
  bool isEmpty = false;

  @override
  void initState() {
    image = widget.image;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: UniqueKey(),
      body: Stack(
        key: UniqueKey(),
        children: [
          Positioned(
              key: UniqueKey(),
              top: 5,
              child: Container(
                color: Colors.red,
                width: size.width,
                height: size.width,
              )),
          Positioned(
            key: UniqueKey(),
            top: 15,
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  size: 35.0,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Positioned(
              key: UniqueKey(),
              top: 20,
              left: size.width * 0.38,
              child: Text(
                "JUFE",
                style: TextStyle(
                    color: Theme.of(context).primaryColor, fontSize: 40.0),
              )),
          Positioned(
            key: UniqueKey(),
            top: 15,
            left: size.width * 0.88,
            child: IconButton(
                onPressed: () {
                  setState(() {
                    isEmpty = true;
                    image = null;
                  });
                },
                icon: Icon(
                  Icons.close,
                  size: 35.0,
                  color: Theme.of(context).primaryColor,
                )),
          ),
          Positioned(
              key: UniqueKey(),
              top: 10,
              bottom: 0,
              left: 5,
              right: 5,
              child: FittedBox(
                key: UniqueKey(),
                child: Material(
                    color: Colors.white,
                    elevation: 25,
                    borderRadius: BorderRadius.circular(25),
                    shadowColor: Colors.red,
                    child: SizedBox(
                      height: size.height / 4,
                      width: size.width * 0.5,
                      child: isEmpty
                          ? const Center(
                              child: Text("No image selected"),
                            )
                          : Image(
                              image: image!.image,
                              fit: BoxFit.cover,
                            ),
                    )),
              ))
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).backgroundColor,
          hoverColor: Theme.of(context).primaryColor,
          child:
              isEmpty ? const Icon(Icons.add_a_photo) : const Icon(Icons.send),
          onPressed: () async {
            if (isEmpty) {
              await MomentUtils().getImage().then((imag) {
                if (imag.path.isNotEmpty) {
                  setState(() {
                    image = Image.file(File(imag.path));
                    isEmpty = false;
                  });
                }
              });
            }
          }),
    );
  }
}
