import 'package:flutter/material.dart';
import 'package:jufe_thesis/UI/pages/MainPages/web/webView.dart';
import 'package:jufe_thesis/utils/common_utils.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  _WebPageState createState() => _WebPageState();
}

class _WebPageState extends State<WebPage> {
  static const jufeEnglishWeb = "JUFE ENGLISH WEBSITE";
  static const jufeChineseWeb = "JUFE CHINESE WEBSITE";
  static const jufeLibraryWeb = "JUFE LIBRARY WEBSITE";
  static const jufeTeacherEvaluation = "TEACHER\nEVALUATION";
  static const jufeClassPlatform = "CLASS\nPLATFORM";
  static const jufeAccountWeb = "JUFE ACCOUNT";
  static const jufe3DView = "JUFE 3D VIEW";

  Map<String, String> _listOptions = {};
  late Size size;

  @override
  void initState() {
    _listOptions.putIfAbsent(jufeEnglishWeb, () => 'http://oice.jxufe.edu.cn/');
    _listOptions.putIfAbsent(jufeChineseWeb, () => 'http://www.jxufe.edu.cn');
    _listOptions.putIfAbsent(
        jufeLibraryWeb, () => 'http://lib.jxufe.edu.cn/en/');
    _listOptions.putIfAbsent(jufeTeacherEvaluation,
        () => 'http://172.29.5.184/framework/index.html');
    _listOptions.putIfAbsent(
        jufeClassPlatform,
        () =>
            'http://passport2.chaoxing.com/mlogin?fid=1412&refer=http://i.mooc.chaoxing.com');
    _listOptions.putIfAbsent(
        jufeAccountWeb, () => 'http://ecampus.jxufe.edu.cn/web/guest/student');
    _listOptions.putIfAbsent(
        jufe3DView, () => 'http://view.jxufe.edu.cn/beibuxiaoqu/index.html');

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).backgroundColor,
          title: const Text("WEB SERVICES"),
          centerTitle: true,
          leading: const SizedBox(),
        ),
        body: ListView.builder(
            itemCount: _listOptions.length,
            itemBuilder: (context, index) =>
                designBox(_listOptions.keys.elementAt(index))));
  }

  Widget designBox(String message) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 15,
            borderRadius: BorderRadius.circular(25),
            shadowColor: Colors.blue,
            child: Column(
              children: <Widget>[
                Text(
                  message,
                  style: TextStyle(
                      color: Colors.red[900],
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.normal),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 10,
                ),
                Center(
                  child: Container(
                    width: size.width,
                    height: size.height / 4,
                    child: Icon(
                      Icons.web,
                      size: 100,
                      color: Colors.red[900],
                    ),
                    decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.rectangle,
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
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        late String caseChosed;
        switch (message) {
          case jufeEnglishWeb:
            caseChosed = jufeEnglishWeb;
            break;
          case jufeChineseWeb:
            caseChosed = jufeChineseWeb;
            break;
          case jufeLibraryWeb:
            caseChosed = jufeLibraryWeb;
            break;
          case jufeTeacherEvaluation:
            caseChosed = jufeTeacherEvaluation;
            break;
          case jufeClassPlatform:
            caseChosed = jufeClassPlatform;
            break;
          case jufeAccountWeb:
            caseChosed = jufeAccountWeb;
            break;
          case jufe3DView:
            caseChosed = jufe3DView;
            break;
          // default:
        }
        if (caseChosed.isNotEmpty) {
          CommonUtils.navigationBarToNextPage(
                  context, WebViewPage(_listOptions[caseChosed]!, caseChosed))
              .then(
                  (value) => CommonUtils.printShowNavigator("WebPages", false));
          CommonUtils.printShowNavigator("WebViewPage", true);
          caseChosed = '';
        }
      },
    );
  }
}
