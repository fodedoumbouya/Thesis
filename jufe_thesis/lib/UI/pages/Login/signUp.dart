import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:jufe_thesis/DB/db/model/userdbModel.dart';
import 'package:jufe_thesis/DB/db/userdb/userdb.dart';
import 'package:jufe_thesis/utils/dialog.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Controler
  final UserDbModel userdb = Get.find();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController nomController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController studentIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repasswordController = TextEditingController();
  TextEditingController logincontroller = TextEditingController();
  Map<String, TextEditingController> cases = {};
  late Size size;

  static const String title = "REGISTER";

  static const String notCorrect = "Not correct";
  static const String notEqual = "Different";
  static const String existStudentID = "Student ID Exist";
  static const String sucess = "Sucess";

  @override
  void initState() {
    cases.addAll({
      "FIRST NAME": nomController,
      "LAST NAME": prenomController,
      "E-MAIL": emailController,
      "STUDENT ID": studentIDController,
      "PASSWORD": passwordController,
      "CONFIRM": repasswordController,
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[50],
        body: SafeArea(
          child: ListView(
            addAutomaticKeepAlives: true,
            children: [
              InkWell(
                child: Container(
                  margin: const EdgeInsets.all(8.0),
                  alignment: Alignment.centerLeft,
                  child: const Icon(
                    Icons.arrow_back,
                    size: 30,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                },
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              const Center(
                child: Text(
                  title,
                  style: TextStyle(fontSize: 30),
                ),
              ),
              SizedBox(
                height: size.height * 0.01,
              ),
              SizedBox(
                height: size.height * 0.65,
                child: Form(
                    key: _formKey,
                    child: Column(
                        children: cases.entries
                            .map((e) => textInput(
                                  e.key,
                                ))
                            .toList())),
              ),
              buttom(title)
            ],
          ),
        ));
  }

  Widget textInput(String type) {
    TextEditingController controller = cases[type]!;
    late TextInputType textInputType;

    if (controller == studentIDController) {
      textInputType = TextInputType.number;
    } else if (controller == emailController) {
      textInputType = TextInputType.emailAddress;
    } else {
      textInputType = TextInputType.text;
    }

    return Container(
      height: size.height * 0.08,
      width: size.width * 0.9,
      margin: const EdgeInsets.all(8.0),
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
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Please Type your $type";
            }
          },
          keyboardType: textInputType,
          decoration: InputDecoration(
            hintText: type,
            helperStyle: const TextStyle(color: Colors.grey),
            border: InputBorder.none,
          ),
          obscureText: controller == repasswordController ? true : false,
        ),
      ),
    );
  }

  handleLogingError(String type, String msg) {
    switch (type) {
      case notCorrect:
        UtilsDialog().ShowShortToast(msg + type, true);
        break;
      case notEqual:
        UtilsDialog().ShowShortToast(msg + type, true);
        break;
      case existStudentID:
        UtilsDialog().ShowShortToast(msg + type, true);
        break;
      case sucess:
        UtilsDialog().ShowShortToast(msg, false);
        break;
    }
  }

  registerUser() {
    if (GetUtils.isEmail(emailController.text)) {
      if (studentIDController.text.length == 10 &&
          studentIDController.text.isNumericOnly) {
        if (passwordController.text == repasswordController.text) {
          //TODO not save directly in the server
          Userdb user = Userdb(
              1,
              nomController.text + " " + prenomController.text,
              emailController.text,
              passwordController.text,
              studentIDController.text,
              false,
              "");
          userdb.setUser(user);
          handleLogingError(sucess, sucess);
          Future.delayed(const Duration(seconds: 2));
          Navigator.of(context).pop();
        } else {
          handleLogingError(notEqual, "Your password is ");
        }
      } else {
        handleLogingError(existStudentID, "Your ");
      }
    } else {
      handleLogingError(notCorrect, "Your E-mail is ");
    }
  }

  Widget buttom(String type) {
    return InkWell(
      child: Container(
        height: 50,
        width: 170,
        margin: const EdgeInsets.only(left: 10, right: 15, top: 20),
        decoration: BoxDecoration(
            color: Colors.blue,
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
        if (_formKey.currentState!.validate()) {
          registerUser();
        }
      },
    );
  }
}
