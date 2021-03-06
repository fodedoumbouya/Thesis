// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jufe_thesis/DB/db/model/userdbModel.dart';
import 'package:jufe_thesis/DB/db/userdb/userdb.dart';
import 'package:jufe_thesis/UI/pages/Login/Login.dart';
import 'package:jufe_thesis/UI/pages/MainPages/mainPage.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

class LaunchPage extends StatefulWidget {
  const LaunchPage({Key? key}) : super(key: key);

  @override
  _LaunchPageState createState() => _LaunchPageState();
}

class _LaunchPageState extends State<LaunchPage> {
  //-------Controller
  final UserDbModel _userDbModel = Get.find();

  late Userdb userdb;

  verification() async {
    if (userdb.login!) {
      CommonUtils.navigationBarToNextPage(context, const MainPage(), true)
          .then((value) => CommonUtils.printShowNavigator("MainPage", false));
      CommonUtils.printShowNavigator("MainPage", true);
    } else {
      CommonUtils.navigationBarToNextPage(context, const Login(), true)
          .then((value) => CommonUtils.printShowNavigator("Login", false));
      CommonUtils.printShowNavigator("Login", true);
    }
  }

  @override
  void initState() {
    userdb = _userDbModel.getUserData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   backgroundColor: Colors.red[600]!,
        body: Stack(
      children: <Widget>[
        Center(
          child: TweenAnimationBuilder(
            tween: ColorTween(
                begin: Theme.of(context).backgroundColor,
                end: Theme.of(context).primaryColor),
            duration: const Duration(seconds: 3),
            onEnd: () {
              verification();
            },
            builder: (_, Color? color, __) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Icon(
                      Icons.school,
                      size: 60,
                      color: Colors.grey[800],
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
                ),
              );
            },
          ),
        ),
      ],
    ));
  }
}
