import 'package:flutter/material.dart';

class Report extends StatefulWidget {
  final String title;
  const Report(this.title, {Key? key}) : super(key: key);

  @override
  _ReportState createState() => _ReportState();
}

class _ReportState extends State<Report> {
  static const String report = "ROOM REPORT";
  static const String suggestion = "SUGGESTION";

  TextEditingController nameController = TextEditingController();
  TextEditingController prenomController = TextEditingController();
  TextEditingController studentIdController = TextEditingController();
  TextEditingController roomNController = TextEditingController();
  TextEditingController problemController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String case4 = "Room Number";
  String description = "Problem Description";
  bool isRoomForm = true;

  late Size size;

  Map<String, String> listChoice = {
    //Key Lost
    "Key Lost": "I lost my Key\nI checked it everywhere but I didn't find it\n",
    "Light problem": "I have a Light problem\nMy Light bulb is not working\n",
    "Bathroom problem":
        "I have a Problem in my bathroom\nSome of my Stuff are not working well\n"
  };
  Map<String, bool> listValue = {
    "Key Lost": false,
    "Light problem": false,
    "Bathroom problem": false
  };

  @override
  void initState() {
    if (widget.title == suggestion) {
      case4 = "Suject";
      description = "Detail Of The Suggestion";
      isRoomForm = false;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        key: UniqueKey(),
        backgroundColor: Theme.of(context).backgroundColor,
        title: Text("${widget.title} FORM"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: roomReport(),
      ),
    );
  }

  Widget roomReport() {
    return Form(
        key: _formKey,
        child: Column(children: [
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: TextFormField(
                    controller: prenomController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please input your First Name';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'First Name',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSaved: (value) {
                      //  _email = value;
                    },
                  ),
                ),
                SizedBox(
                  width: size.width / 2,
                  child: TextFormField(
                    controller: nameController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please input your Last Name';
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Last Name',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSaved: (value) {
                      //  _email = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //-----------------------------------------
          SizedBox(
            width: size.width,
            child: Row(
              children: [
                SizedBox(
                  width: size.width / 2,
                  child: TextFormField(
                    controller: studentIdController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please input your Student ID';
                      }
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Student ID',
                      contentPadding: const EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSaved: (value) {
                      //  _email = value;
                    },
                  ),
                ),
                SizedBox(
                  width: size.width / 2,
                  child: TextFormField(
                    controller: roomNController,
                    validator: (input) {
                      if (input!.isEmpty) {
                        return 'Please input your $case4';
                      }
                    },
                    keyboardType:
                        isRoomForm ? TextInputType.number : TextInputType.text,
                    decoration: InputDecoration(
                      hintText: case4,
                      contentPadding: const EdgeInsets.all(15.0),
                      border: InputBorder.none,
                      filled: true,
                      fillColor: Colors.grey[200],
                    ),
                    onSaved: (value) {
                      //  _email = value;
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //----------------------------------------------------------------------
          isRoomForm
              ? SizedBox(
                  height: 40.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      caseReport("Key Lost"),
                      caseReport("Light problem"),
                      caseReport("Bathroom problem"),
                    ],
                  ),
                )
              : const SizedBox(),

          //------------------------------------
          Container(
            height: size.height / 4,
            color: Colors.grey[200],
            child: TextFormField(
              controller: problemController,
              autocorrect: true,
              maxLines: 100,
              //controller: emailController,
              validator: (input) {
                if (input!.isEmpty) {
                  return 'Please input $description';
                }
              },
              decoration: InputDecoration(
                hintText: description,
                contentPadding: const EdgeInsets.all(15.0),
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          //-------------------------------
          isRoomForm
              ? SizedBox(
                  height: size.height / 4.5,
                  child: FittedBox(
                    key: UniqueKey(),
                    child: Material(
                        color: Colors.white,
                        elevation: 25,
                        borderRadius: BorderRadius.circular(25),
                        shadowColor: Colors.red,
                        child: SizedBox(
                            height: size.height / 4,
                            width: size.width,
                            child:
                                //isEmpty
                                //    ?
                                const Center(
                              child: Text("No image selected"),
                            )
                            // : Image(
                            //     image: image!.image,
                            //     fit: BoxFit.cover,
                            //   ),
                            )),
                  ))
              : const SizedBox(
                  height: 10,
                ),
          //------------------------------------------
          Container(
              height: 50,
              width: 170,
              margin: const EdgeInsets.only(left: 0, right: 15, top: 20),
              decoration: BoxDecoration(
                  color: Colors.red[900],
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Color.fromRGBO(225, 95, 27, .3),
                        blurRadius: 20,
                        offset: Offset(0, 15))
                  ]),
              child: GestureDetector(
                child: const Text(
                  'SEND',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                onTap: () {
                  print('click on Connexion');
                },
              )),
        ]));
  }

  Widget caseReport(String title) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Checkbox(
          value: listValue[title],
          onChanged: (value) async {
            bool bo = false;
            for (var i = 0; i < listValue.length; i++) {
              print(
                  "${listValue.keys.elementAt(i)} : ${listValue.values.elementAt(i)}");
              if (listValue.values.elementAt(i)) {
                bo = listValue.values.elementAt(i);
              }
            }
            print("================================================>$bo");
            if (!bo) {
              problemController.clear();
            }
            setState(() {
              problemController.text =
                  problemController.text + listChoice[title].toString();
              listValue[title] = value!;
            });
          },
        ),
        Text(
          title,
          style:
              TextStyle(fontSize: 15, color: Theme.of(context).backgroundColor),
        ),
      ],
    );
  }
}
