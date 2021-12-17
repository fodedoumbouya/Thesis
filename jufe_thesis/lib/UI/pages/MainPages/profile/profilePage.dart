import 'package:flutter/material.dart';
import 'package:jufe_thesis/UI/pages/MainPages/profile/services/servicesHomePage.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Stack(
          key: UniqueKey(),
          children: [
            Positioned(
              key: UniqueKey(),
              top: 15,
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chat,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
            Positioned(
              key: UniqueKey(),
              top: 15,
              right: 10,
              child: IconButton(
                  onPressed: () {
                    CommonUtils.navigationBarToNextPage(
                            context, const ServicesPage())
                        .then((value) => CommonUtils.printShowNavigator(
                            "ServicesPage", false));
                    CommonUtils.printShowNavigator("ServicesPage", true);
                  },
                  icon: const Icon(
                    Icons.menu,
                    size: 40,
                    color: Colors.white,
                  )),
            ),
            Positioned(
                key: UniqueKey(),
                top: size.height * 0.1,
                left: size.width / 4,
                child: const Text(
                  "PROFIL",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                )),
            Positioned(
                key: UniqueKey(),
                top: size.height * 0.3,
                child: Container(
                  width: size.width,
                  height: size.height,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(70.0),
                          topRight: Radius.circular(70.0)),
                      color: Colors.white),
                  //  child: Col,
                )),
            Positioned(
                key: UniqueKey(),
                top: size.height * 0.25,
                left: size.width / 3,
                child: SizedBox(
                  height: size.height / 6,
                  width: size.width / 3,
                  child: Material(
                    elevation: 20,
                    borderRadius: BorderRadius.circular(75),
                    shadowColor: Theme.of(context).backgroundColor,
                    color: Colors.transparent,
                    child: ClipOval(
                      child: Image.asset(
                        "images/j1.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )),
            Positioned(
                key: UniqueKey(),
                top: size.height / 2.2,
                left: 10,
                child: textDisplay('Email Adrress', 'test@qq.com')),
            Positioned(
                key: UniqueKey(),
                top: size.height / 1.85,
                left: 10,
                child: textDisplay('Name', 'test Name')),
            Positioned(
                key: UniqueKey(),
                top: size.height / 1.6,
                left: 10,
                child: textDisplay('Student ID', '2000000')),
            Positioned(
              key: UniqueKey(),
              top: size.height / 1.15,
              left: 10,
              child: Row(
                children: [
                  const Text('Log Out'),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.power_settings_new,
                    color: Theme.of(context).backgroundColor,
                  ),
                ],
              ),
            ),
            Positioned(
                key: UniqueKey(),
                top: size.height / 1.15,
                right: 10,
                child: Text(
                  'About',
                  style: TextStyle(color: Theme.of(context).backgroundColor),
                )),
            Positioned(
                key: UniqueKey(),
                top: size.height / 1.4,
                left: size.width / 2.8,
                child: Center(
                  child: Container(
                    alignment: Alignment.center,
                    width: size.width / 3.8,
                    height: size.width / 3.8,
                    child: Icon(
                      Icons.perm_identity,
                      size: 40,
                      color: Colors.red[900],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey[600]!,
                              offset: const Offset(4.0, 4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                          const BoxShadow(
                              color: Colors.white,
                              offset: Offset(-4.0, -4.0),
                              blurRadius: 15.0,
                              spreadRadius: 1.0),
                        ],
                        gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              Colors.grey[200]!,
                              Colors.grey[300]!,
                              Colors.grey[400]!,
                              Colors.grey[500]!,
                            ],
                            stops: const [
                              0.1,
                              0.3,
                              0.8,
                              0.9
                            ])),
                  ),
                ))
          ],
        ));
  }

  Widget textDisplay(String head, content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          head,
          style: const TextStyle(fontSize: 20),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(content,
            style: const TextStyle(
                color: Colors.grey, fontSize: 15, fontWeight: FontWeight.bold)),
        const Divider(),
      ],
    );
  }
}
