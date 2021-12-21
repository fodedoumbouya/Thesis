import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jufe_thesis/DB/db/model/userdbModel.dart';
import 'package:jufe_thesis/DB/db/userdb/userdb.dart';
import 'package:jufe_thesis/UI/pages/Login/forgotPassword/forgotPassword.dart';
import 'package:jufe_thesis/UI/pages/Login/signUp.dart';
import 'package:jufe_thesis/UI/pages/MainPages/mainPage.dart';
import 'package:jufe_thesis/utils/common_utils.dart';
import 'package:jufe_thesis/utils/dialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // Controler
  final UserDbModel userdb = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  late Size size;

  static const String emailField = "E-MAIL";
  static const String passField = "PASSWORD";
  static const String loginButton = "Log-In";
  static const String signUpButton = "Sign-Up";

  bool isHiden = true;

  Widget textInput(String type) {
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
                color: Color.fromRGBO(225, 95, 27, .3),
                blurRadius: 20,
                offset: Offset(0, 15))
          ]),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: type == emailField ? emailController : passwordController,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Type your $type";
            }
          },
          decoration: InputDecoration(
            hintText: type,
            helperStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          obscureText: type == emailField ? false : isHiden,
        ),
      ),
    );
  }

  Widget buttom(String type) {
    return InkWell(
      child: Container(
        height: 50,
        width: 170,
        margin: const EdgeInsets.only(left: 10, right: 15, top: 20),
        decoration: BoxDecoration(
            color: type == loginButton
                ? Colors.blue
                : Theme.of(context).backgroundColor,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [
              BoxShadow(
                  color: Color.fromRGBO(225, 95, 67, .5),
                  blurRadius: 20,
                  offset: Offset(0, 2))
            ]),
        child: Center(
          child: Text(
            type,
            style: TextStyle(
                fontSize: 30.0, color: Theme.of(context).primaryColor),
          ),
        ),
      ),
      onTap: () {
        if (type == loginButton) {
          if (_formKey.currentState!.validate()) {
            loginVerification();
          }
        } else {
          CommonUtils.navigationBarToNextPage(context, const SignUp(), false)
              .then((value) => CommonUtils.printShowNavigator("SignUp", false));
          CommonUtils.printShowNavigator("SignUp", true);
        }
      },
    );
  }

  loginVerification() {
    //TODO change to server verifation
    Userdb user = userdb.getUserData();
    if (emailController.text == user.email) {
      if (passwordController.text == user.password) {
        user.login = true;
        userdb.setUser(user);
        CommonUtils.navigationBarToNextPage(context, const MainPage(), false)
            .then((value) => CommonUtils.printShowNavigator("MainPage", false));
        CommonUtils.printShowNavigator("MainPage", true);
      } else {
        UtilsDialog().ShowShortToast("Password not correct", true);
      }
    } else {
      UtilsDialog().ShowShortToast("Email not correct", true);
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: BoxDecoration(
                gradient: LinearGradient(begin: Alignment.topLeft, colors: [
              Colors.red[900]!,
              Colors.red[600]!,
              Colors.red[400]!,
            ])),
            child: Stack(
              children: [
                Positioned(
                    top: size.height * 0.15,
                    left: size.width / 3.5,
                    child: Text(
                      "CONNEXION",
                      style: TextStyle(
                          fontSize: 30, color: Theme.of(context).primaryColor),
                    )),
                Positioned(
                    top: size.height / 3.5,
                    child: Container(
                      height: size.height,
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.grey[50],
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(40.0),
                              topRight: Radius.circular(40.0))),
                      child: Form(
                        key: _formKey,
                        child: Stack(
                          children: [
                            Positioned(
                              top: size.height * 0.09,
                              left: size.width / 10,
                              child: textInput(emailField),
                            ),
                            Positioned(
                              top: size.height * 0.19,
                              left: size.width / 10,
                              child: textInput(passField),
                            ),
                            Positioned(
                              top: size.height * 0.3,
                              left: 10,
                              child: buttom(loginButton),
                            ),
                            Positioned(
                              top: size.height * 0.3,
                              right: 10,
                              child: buttom(signUpButton),
                            ),
                            Positioned(
                              top: size.height * 0.42,
                              left: size.width / 3,
                              child: InkWell(
                                child: const Text(
                                  "Forgot password ?",
                                ),
                                onTap: () {
                                  CommonUtils.navigationBarToNextPage(context,
                                          const ForgotPassword(), false)
                                      .then((value) =>
                                          CommonUtils.printShowNavigator(
                                              "ForgotPassword", false));
                                  CommonUtils.printShowNavigator(
                                      "ForgotPassword", true);
                                },
                              ),
                            ),
                            Positioned(
                                top: size.height * 0.4,
                                left: size.width / 3.5,
                                child: logo()),
                            Positioned(
                                top: size.height * 0.20,
                                left: size.width * 0.77,
                                child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        isHiden = !isHiden;
                                      });
                                    },
                                    icon: Icon(
                                      isHiden
                                          ? Icons.visibility_off_sharp
                                          : Icons.visibility_sharp,
                                    ))),
                          ],
                        ),
                      ),
                    )),
              ],
            )));
  }

  Widget logo() {
    return Container(
      width: size.width * 0.45,
      height: size.height * 0.4,
      child: Icon(
        Icons.lock_open,
        size: 80,
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
    );
  }
}
